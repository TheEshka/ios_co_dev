//
//  ESKTabBar.m
//  MainProject
//
//  Created by Gagik on 23/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKTabBar.h"
#import "ESKTabBarCollectionView.h"
#import "ESKTabBarItem.h"

@interface ESKTabBar ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) ESKTabBarCollectionView *tabBarCollectionView;
@property (nonatomic, strong) NSMutableArray<NSString *> *tabsArray;
@property (nonatomic, assign) NSInteger previousSelectedItemNumber;

@property (nonatomic, assign) BOOL isDelegatedAction;

@end

@implementation ESKTabBar

static NSString * const ESKTabBarReuseIdentifier = @"TabBarCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBarCollectionView registerClass:[ESKTabBarItem class] forCellWithReuseIdentifier:ESKTabBarReuseIdentifier];
    self.previousSelectedItemNumber = -1;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    //[self selectItemNumber:0];
}


#pragma mark - User Interface

- (void)addItemWithTitle:(NSString *)title;
{
    [self.tabsArray addObject:title];
    
}

- (void)selectDelegatedItemNumber:(NSInteger)number
{
    self.isDelegatedAction = YES;
    [self selectItemNumber:number];
    self.isDelegatedAction = NO;
}


- (void)selectItemNumber:(NSInteger)number
{
    //проверка границ
    if ((number >= [self.tabsArray count]) || (number < 0))
    {
        return;
    }
    
    if (self.previousSelectedItemNumber != number)
    {
        [self.tabBarCollectionView.delegate collectionView:self.tabBarCollectionView didDeselectItemAtIndexPath:[NSIndexPath indexPathForItem:self.previousSelectedItemNumber inSection:0]];\
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:number inSection:0];
    [self.tabBarCollectionView.delegate collectionView:self.tabBarCollectionView didSelectItemAtIndexPath:indexPath];
    [self.tabBarCollectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:0];
}


#pragma mark  - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *previousIndexPath = [NSIndexPath indexPathForItem:self.previousSelectedItemNumber inSection:0];
    if ([previousIndexPath isEqual:indexPath])
    {
        return;
    }
    ESKTabBarItem *tabBarItem = (ESKTabBarItem *)[collectionView cellForItemAtIndexPath:indexPath];
    [tabBarItem itemAnimationFocusing];
    self.previousSelectedItemNumber = indexPath.item;
    
    if (self.isDelegatedAction)
    {
        return;
    }
    [self.delegate selectedBarItemNumber:indexPath.item];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ESKTabBarItem *tabBarItem = (ESKTabBarItem *)[collectionView cellForItemAtIndexPath:indexPath];
    [tabBarItem itemAnimationUnfocusing];
}


#pragma mark  - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.tabsArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ESKTabBarItem *cell = (ESKTabBarItem *)[collectionView dequeueReusableCellWithReuseIdentifier:ESKTabBarReuseIdentifier forIndexPath:indexPath];
    [cell setName:self.tabsArray[indexPath.row]];
    return cell;
}


#pragma mark  - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.view.frame)/[self.tabsArray count], CGRectGetHeight(self.view.frame));
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


#pragma mark - Lazy Getters

- (NSMutableArray<NSString *> *)tabsArray
{
    if (!_tabsArray)
    {
        _tabsArray = [NSMutableArray new];
    }
    return _tabsArray;
}

- (UICollectionView *)tabBarCollectionView
{
    if (!_tabBarCollectionView)
    {
        _tabBarCollectionView = [[ESKTabBarCollectionView alloc] init];
        _tabBarCollectionView.delegate = self;
        _tabBarCollectionView.dataSource = self;
        _tabBarCollectionView.gestureDelegate = self;
        self.view = _tabBarCollectionView;
    }
    return _tabBarCollectionView;
}

@end
