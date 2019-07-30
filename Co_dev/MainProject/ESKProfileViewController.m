//
//  ESKProfileViewController.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKProfileViewController.h"
#import "ESKProfileView.h"
#import "ESKProfileViewProtocols.h"
#import "ESKAuthenticationViewController.h"
#import "ESKProfilePresenter.h"

@interface ESKProfileViewController ()<ESKProfileViewDelegate>

@property (nonatomic, strong) ESKProfileView *profileView;
@property (nonatomic, strong) ESKAuthenticationViewController *authenticationViewController;

@end

@implementation ESKProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.presenter = [ESKProfilePresenter new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissHandler) name:@"dissMissVC" object:nil];
    
    [self setupAuthorizedProfileView];
    if (![self.presenter isCustomerAuthorized])
    {
        [self presentViewController:self.authenticationViewController animated:YES completion:nil];
        return;
    }
}

- (void)setupAuthorizedProfileView
{
    self.profileView = [[ESKProfileView alloc] init];
    self.profileView.frame = self.view.frame;
    self.profileView.delegate = self;
    self.view = self.profileView;
    [self.profileView setUser:[self.presenter getProfileInfo]];
}

- (void)exitButtonPressed
{
    [self.presenter deleteUserData];
    [self presentViewController:self.authenticationViewController animated:YES completion:nil];
}

- (void)dismissHandler
{
    [self.profileView setUser:[self.presenter getProfileInfo]];
}


#pragma mark - Lazy Getters

- (ESKAuthenticationViewController *)authenticationViewController
{
    if(!_authenticationViewController)
    {
        _authenticationViewController = [[ESKAuthenticationViewController alloc] init];
    }
    return _authenticationViewController;
}



//- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
//{
//    [super dismissViewControllerAnimated:YES completion:completion];
//
//    if (![self.presenter isCustomerAuthorized])
//    {
//        self.view = self.notAuthorizedProfileView;
//    }
//    [self presentViewController:self.authenticationViewController animated:YES completion:nil];
//}

//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
//{
//    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//    [self.view layoutIfNeeded];
//}




@end
