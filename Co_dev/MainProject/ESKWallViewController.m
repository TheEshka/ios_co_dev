//
//  ESKWallViewController.m
//  MainProject
//
//  Created by Gagik on 27/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKWallViewController.h"
#import "ESKWallCollectionView.h"
#import "ESKWallPostCell.h"
#import "ESKPost.h"
#import "ESKWallPresenter.h"
#import "ESKWallModel.h"
#import "ESKNetworkService.h"

@interface ESKWallViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray<ESKPost *> *posts;
@property (nonatomic, strong) ESKWallCollectionView *wallCollection;

@property (nonatomic, assign) BOOL nextPageIsOpening;
@property (nonatomic, assign) CGFloat viewBootomEdge;

@end

@implementation ESKWallViewController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - Lify Cycle

- (instancetype)initWithNetworkSerice:(ESKNetworkService *)networkService
{
    self = [super initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    if (self) {
        ESKWallPresenter *presenter = [ESKWallPresenter new];
        ESKWallModel *model= [ESKWallModel new];
        model.networkService = networkService;
        networkService.wallOutput = model;
        presenter.model = model;
        presenter.viewController = self;
        model.delegate = presenter;
        _presenter = presenter;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wallCollection = [[ESKWallCollectionView alloc] initWithFrame:self.view.frame];
    self.collectionView = self.wallCollection;
    self.wallCollection.dataSource = self;
    self.wallCollection.delegate = self;
    [self.wallCollection registerClass:[ESKWallPostCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.presenter getNextPosts];
}


#pragma mark - ESKWallPresenterDelegate

- (void)triggerViewController
{
    [self.wallCollection reloadData];
    self.nextPageIsOpening = NO;
}


- (void)setImage:(NSData *)data forItem:(NSInteger)number
{
    NSIndexPath *path = [NSIndexPath indexPathForItem:number inSection:0];
    ESKWallPostCell *cell = (ESKWallPostCell *)[self.wallCollection cellForItemAtIndexPath:path];
    [cell setImage:[UIImage imageWithData:data]];
    return;
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.presenter presentedPostsCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ESKWallPostCell *cell = (ESKWallPostCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    ESKPost *post = [self.presenter getPostForItem:indexPath.row];
    if (post.postImage.imageID && !post.postImage.image)
    {
        [self.presenter getImadeWithID:post.postImage.imageID];
    }
    cell.post = post;
    return cell;
}


#pragma mark - UICollectionViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat bottomEdge = scrollView.contentOffset.y + CGRectGetHeight(scrollView.frame);
    if ((bottomEdge >= scrollView.contentSize.height) && !self.nextPageIsOpening && self.viewBootomEdge < scrollView.contentSize.height)
    {
        self.viewBootomEdge = scrollView.contentSize.height;
        self.nextPageIsOpening = YES;
        [self.presenter getNextPosts];
    }
}


#pragma mark - UIContentContainer

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self.view layoutIfNeeded];
}

@end
