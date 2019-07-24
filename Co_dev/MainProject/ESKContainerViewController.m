//
//  ESKContainerViewController.m
//  MainProject
//
//  Created by Gagik on 23/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKContainerViewController.h"
#import "ESKContainerCollectionViewController.h"
#import "ESKTabBar.h"

@interface ESKContainerViewController ()<ESKTabBarDelegate, ESKContainerCollectionViewControllerDelegate>

@property (nonatomic, strong) ESKContainerCollectionViewController *collectionViewController;
@property (nonatomic, strong) ESKTabBar *tabBar;

@end

@implementation ESKContainerViewController

#pragma mark - Lify Cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupContainerCollectionView];
        [self setupTapBar];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
}


#pragma mark - Customer Interface

- (void)addContentViewController:(UIViewController *)viewController forTitle:(NSString *)title
{
    [self.collectionViewController addViewController:viewController];
    [self.tabBar addItemWithTitle:title];
}


#pragma mark - Helper Setup Methods

- (void)setupTapBar
{
    self.tabBar = [[ESKTabBar alloc] init];
    [self addChildViewController:self.tabBar];
    [self.tabBar didMoveToParentViewController:self];
    self.tabBar.view.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) * 0.9f, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) * 0.1f);
    [self.view addSubview:self.tabBar.view];
    self.tabBar.delegate = self;
}

- (void)setupContainerCollectionView
{
    self.collectionViewController = [[ESKContainerCollectionViewController alloc] init];
    [self addChildViewController:self.collectionViewController];
    [self.collectionViewController didMoveToParentViewController:self];
    self.collectionViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) * 0.9f);
    [self.view addSubview:self.collectionViewController.view];
    self.collectionViewController.delegate = self;
}


#pragma mark - ESKTabBarDelegate

- (void)selectedBarItemNumber:(NSInteger)num
{
    [self.collectionViewController openViewControllerNumber:num];
}


#pragma mark - ESKContainerCollectionViewControllerDelegate

- (void)collectionViewChangePageTo:(NSInteger)num
{
    [self.tabBar selectDelegatedItemNumber:num];
}

@end
