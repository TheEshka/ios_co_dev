//
//  ESKProfileViewController.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKProfileViewController.h"
#import "ESKNotAuthorizedProfileView.h"
#import "ESKProfileView.h"
#import "ESKProfileViewProtocols.h"
#import "ESKAuthenticationViewController.h"
#import "ESKProfilePresenter.h"

@interface ESKProfileViewController ()<ESKProfileViewDelegate>

@property (nonatomic, strong) ESKNotAuthorizedProfileView *notAuthorizedProfileView;
@property (nonatomic, strong) ESKProfileView *profileView;
@property (nonatomic, strong) ESKAuthenticationViewController *authenticationViewController;

@end

@implementation ESKProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.presenter = [ESKProfilePresenter new];
    
    [self setupAuthorizedProfileView];
    if (![self.presenter isCustomerAuthorized])
    {
        [self presentViewController:self.authenticationViewController animated:YES completion:nil];
        return;
    }
}

//- (void)setupNotAuthorizedProfileView
//{
//    self.notAuthorizedProfileView = [[ESKNotAuthorizedProfileView alloc] init];
//    self.notAuthorizedProfileView.delegate = self;
//    self.view = self.notAuthorizedProfileView;
//}

- (void)setupAuthorizedProfileView
{
    self.profileView = [[ESKProfileView alloc] init];
    self.profileView.frame = self.view.frame;
    self.profileView.delegate = self;
//    [self.view addSubview:self.authorizedProfileView];
    self.view = self.profileView;
}



//- (void)authorizationButtonPressed
//{
//    self.authenticationViewController = [[ESKAuthenticationViewController alloc] init];
//    [self presentViewController:self.authenticationViewController animated:YES completion:nil];
//}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    [super dismissViewControllerAnimated:YES completion:completion];

    if (![self.presenter isCustomerAuthorized])
    {
        self.view = self.notAuthorizedProfileView;
    }
    [self presentViewController:self.authenticationViewController animated:YES completion:nil];
}


- (void)exitButtonPressed
{
    [self.presenter deleteUserData];
    [self presentViewController:self.authenticationViewController animated:YES completion:nil];
}


#pragma mark - Lazy Getters

//- (ESKNotAuthorizedProfileView *)notAuthorizedProfileView
//{
//    if (!_notAuthorizedProfileView)
//    {
//        _notAuthorizedProfileView = [[ESKNotAuthorizedProfileView alloc] init];
////        _notAuthorizedProfileView.delegate = self;
//        self.view = _notAuthorizedProfileView;
//    }
//    return _notAuthorizedProfileView;
//}


- (ESKAuthenticationViewController *)authenticationViewController
{
    if(!_authenticationViewController)
    {
        _authenticationViewController = [[ESKAuthenticationViewController alloc] init];
    }
    return _authenticationViewController;
}

//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
//{
//    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//    [self.view layoutIfNeeded];
//}
//
//- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize
//{
//    return parentSize;
//}



@end
