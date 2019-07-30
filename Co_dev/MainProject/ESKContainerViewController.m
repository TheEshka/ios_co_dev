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
@property (nonatomic, assign) NSInteger viewControllerNumber;

@end

@implementation ESKContainerViewController

#pragma mark - Lify Cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        [self setupContainerCollectionView];
        [self setupTapBar];
        self.definesPresentationContext = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    self.viewControllerNumber = 0;
    [self.tabBar selectItemNumber:self.viewControllerNumber];
    [super viewDidAppear:YES];
}


#pragma mark - Customer Interface

- (void)addContentViewController:(UIViewController *)viewController forTitle:(NSString *)title
{
    [self.collectionViewController addViewController:viewController];
    [self.tabBar addItemWithTitle:title];
    [self setupConstraints];
    
}

- (void)setStartViewController:(NSInteger)number
{
    self.viewControllerNumber = number;
}


#pragma mark - Helper Setup Methods

- (void)setupConstraints
{
    self.collectionViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.tabBar.view.translatesAutoresizingMaskIntoConstraints = NO;
    CGFloat barHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    NSArray<NSLayoutConstraint *> *constraints=
    @[
      [self.collectionViewController.view.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:barHeight],
      [self.collectionViewController.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
      [self.collectionViewController.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
      [self.collectionViewController.view.bottomAnchor constraintEqualToAnchor:self.tabBar.view.topAnchor],
//      [self.collectionViewController.view.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.85],
      
      
//      [self.tabBar.view.topAnchor constraintEqualToAnchor:self.collectionViewController.view.bottomAnchor],
      [self.tabBar.view.heightAnchor constraintEqualToConstant:70.0f],
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
    [self.view addSubview:self.tabBar.view];
    self.tabBar.delegate = self;
}

- (void)setupContainerCollectionView
{
    self.collectionViewController = [[ESKContainerCollectionViewController alloc] init];
    [self addChildViewController:self.collectionViewController];
    [self.collectionViewController didMoveToParentViewController:self];
    [self.view addSubview:self.collectionViewController.view];
    self.collectionViewController.delegate = self;
}


#pragma mark - ESKTabBarDelegate

- (void)selectedBarItemNumber:(NSInteger)number
{
    self.viewControllerNumber = number;
    [self.collectionViewController openViewControllerNumber:number];
}


#pragma mark - ESKContainerCollectionViewControllerDelegate

- (void)collectionViewChangedPageTo:(NSInteger)number
{
    self.viewControllerNumber = number;
    [self.tabBar selectDelegatedItemNumber:number];
}


//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
//{
//    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//    //[self.view.superview layoutIfNeeded];
//    [self.collectionViewController openViewControllerNumber:self.viewControllerNumber];
//}
//
//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
//{
//    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
//    [self.collectionViewController openViewControllerNumber:self.viewControllerNumber];
//}

@end
