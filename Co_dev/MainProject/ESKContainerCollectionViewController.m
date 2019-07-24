//
//  ESKContainerCollectionViewController.m
//  MainProject
//
//  Created by Gagik on 24/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKContainerCollectionViewController.h"
#import "ESKContainerCollectionView.h"
#import "ESKContainerCollectionViewCell.h"

@interface ESKContainerCollectionViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) ESKContainerCollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<UIViewController *> *viewControllersArray;

@property (nonatomic, assign) BOOL isDelegatedAction;
@property (nonatomic, assign) NSInteger delegateViewNumber;

@end

@implementation ESKContainerCollectionViewController

static NSString * const ESKMainReuseIdentifier = @"MainCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[ESKContainerCollectionViewCell class] forCellWithReuseIdentifier:ESKMainReuseIdentifier];
}

- (void)addViewController:(UIViewController *)viewController
{
    [self.viewControllersArray addObject:viewController];
}

- (void)openViewControllerNumber:(NSInteger)num
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:num inSection:0];
    self.isDelegatedAction = YES;
    self.delegateViewNumber = num;
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.viewControllersArray count];;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ESKContainerCollectionViewCell *cell = (ESKContainerCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:ESKMainReuseIdentifier forIndexPath:indexPath];
    cell.contentViewController = self.viewControllersArray[indexPath.row];;
    return cell;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSInteger qwe = targetContentOffset->x / CGRectGetWidth(self.collectionView.frame);
    [self.delegate collectionViewChangePageTo:qwe];
}


#pragma mark - UICollectionViewDataSource

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UIViewController *currentViewController = self.viewControllersArray[indexPath.row];
//    ((ESKContainerCollectionViewCell *)cell).hostView = nil;
//    [currentViewController removeFromParentViewController];
//    [currentViewController willMoveToParentViewController:nil];
    
    [((ESKContainerCollectionViewCell *)cell) removeViewControllerFromParentViewController];
}


- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UIViewController *currentViewController = self.viewControllersArray[indexPath.row];
//    [self addChildViewController:currentViewController];
//    currentViewController.view.frame = cell.contentView.bounds;
//    ((ESKContainerCollectionViewCell *)cell).hostView = currentViewController.view;
//    [currentViewController didMoveToParentViewController:self];
    
    [((ESKContainerCollectionViewCell *)cell) addViewControllerToParentViewController:self];
    
    //Для случаев когда был вызван от таб бара и не нужно возвращать действие
    if (self.isDelegatedAction)
    {
        //Для случаев, когда перескакиваем несколько контроллеров по тап бару
        if (self.delegateViewNumber == indexPath.item)
        {
            self.isDelegatedAction = NO;
        }
        return;
    }
    [self.delegate collectionViewChangePageTo:indexPath.item];
}


#pragma mark  - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


#pragma mark - Lazy Getters

- (ESKContainerCollectionView *)collectionView
{
    if (!_collectionView)
    {
        _collectionView = [[ESKContainerCollectionView alloc] init];
        self.view = _collectionView;
        [_collectionView setPagingEnabled:YES];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (NSMutableArray<UIViewController *> *)viewControllersArray
{
    if (!_viewControllersArray)
    {
        _viewControllersArray = [NSMutableArray new];
    }
    return _viewControllersArray;
}

@end
