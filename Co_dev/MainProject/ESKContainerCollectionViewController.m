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

@property (nonatomic, assign) BOOL disableDelegatedAction;
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

- (void)openViewControllerNumber:(NSInteger)number
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:number inSection:0];
    self.disableDelegatedAction = YES;
    self.delegateViewNumber = number;
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.viewControllersArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ESKContainerCollectionViewCell *cell = (ESKContainerCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:ESKMainReuseIdentifier forIndexPath:indexPath];
    cell.contentViewController = self.viewControllersArray[indexPath.row];;
    return cell;
}


#pragma mark - UICollectionViewDelegate

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
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger itemNumber = scrollView.contentOffset.x / CGRectGetWidth(self.collectionView.frame) + 0.5;
    
    //Для случаев когда был вызван от таб бара и не нужно возвращать действие
    if (self.disableDelegatedAction)
    {
        //Для случаев, когда перескакиваем несколько контроллеров по тап бару
        if (self.delegateViewNumber == itemNumber)
        {
            self.disableDelegatedAction = NO;
        }
        return;
    }
    [self.delegate collectionViewChangedPageTo:itemNumber];
    
    
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



- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    //[self.view.superview layoutIfNeeded];
//    self.disableDelegatedAction = YES;
//    self.delegateViewNumber = -1;
//    [self.collectionViewController openViewControllerNumber:self.viewControllerNumber];
    self.collectionView.contentOffset = CGPointMake(self.collectionView.contentOffset.x /size.height *size.width, self.collectionView.contentOffset.y);
    //self.collectionView.contentOffset.x
}

//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
//{
//    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
////    [self.collectionViewController openViewControllerNumber:self.viewControllerNumber];
//    self.disableDelegatedAction = NO;
//}


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
