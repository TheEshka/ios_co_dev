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
    [self.tabBar selectItemNumber:1];
    [super viewDidAppear:YES];
}


#pragma mark - Customer Interface

- (void)addContentViewController:(UIViewController *)viewController forTitle:(NSString *)title
{
    [self.collectionViewController addViewController:viewController];
    [self.tabBar addItemWithTitle:title];
    [self setupConstraints];
    
}


#pragma mark - Helper Setup Methods

- (void)setupConstraints
{
    self.collectionViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.tabBar.view.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray<NSLayoutConstraint *> *constraints=
    @[
      [self.collectionViewController.view.topAnchor constraintEqualToAnchor:self.view.topAnchor],
      [self.collectionViewController.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
      [self.collectionViewController.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
      [self.collectionViewController.view.bottomAnchor constraintEqualToAnchor:self.tabBar.view.topAnchor],
      
      [self.tabBar.view.heightAnchor constraintEqualToConstant:100.0f],
      [self.tabBar.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
      [self.tabBar.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
      [self.tabBar.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    
      ];
    [self.view addConstraints:constraints];
}

- (void)setupTapBar
{
    self.tabBar = [[ESKTabBar alloc] init];
    [self addChildViewController:self.tabBar];
    [self.tabBar didMoveToParentViewController:self];
    //self.tabBar.view.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) * 0.9f, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) * 0.1f);
    [self.view addSubview:self.tabBar.view];
    self.tabBar.delegate = self;
}

- (void)setupContainerCollectionView
{
    self.collectionViewController = [[ESKContainerCollectionViewController alloc] init];
    [self addChildViewController:self.collectionViewController];
    [self.collectionViewController didMoveToParentViewController:self];
    //self.collectionViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) * 0.9f);
    [self.view addSubview:self.collectionViewController.view];
    self.collectionViewController.delegate = self;
}


#pragma mark - ESKTabBarDelegate

- (void)selectedBarItemNumber:(NSInteger)num
{
    [self.collectionViewController openViewControllerNumber:num];
}


#pragma mark - ESKContainerCollectionViewControllerDelegate

- (void)collectionViewChangedPageTo:(NSInteger)num
{
    [self.tabBar selectDelegatedItemNumber:num];
}

@end
