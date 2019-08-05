//
//  AuthenticationViewController.m
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKAuthenticationViewController.h"
#import "ESKAuthenticationView.h"
#import "ESKNetworkService.h"
#import "ESKRegistrationViewController.h"
#import "ESKAuthenticationPresenter.h"


@interface ESKAuthenticationViewController ()

@property (nonatomic, strong) ESKAuthenticationView *authenticationView;

@end

@implementation ESKAuthenticationViewController

#pragma mark - ViewController Lify Cycle

- (instancetype)initWithAuthenticateServie:(ESKNetworkService *)networkService
{
    self = [super init];
    if (self) {
        self.modalTransitionStyle = 0;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.definesPresentationContext = YES;
        
        ESKAuthenticationPresenter *presenter = [ESKAuthenticationPresenter new];
        ESKAuthenticationView *authenticationView = [[ESKAuthenticationView alloc] init];
        presenter.authenticationService = networkService;
        presenter.delegate = authenticationView;
        authenticationView.delegate = self;
        authenticationView.presenter = presenter;
        networkService.authorizationDelegate = presenter;
        self.authenticationView = authenticationView;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view = self.authenticationView;
}


#pragma mark - ESKAuthenticationViewDelegate

- (void)registrationButtonPressed
{
    ESKNetworkService *registrationService = (ESKNetworkService *)((ESKAuthenticationPresenter *)self.authenticationView.presenter).authenticationService;
    ESKRegistrationViewController *registrationViewController = [[ESKRegistrationViewController alloc] initWithRegistrateService:registrationService];
    [self presentViewController:registrationViewController animated:YES completion:nil];
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIContentContainer

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    self.view.frame = CGRectMake(0, 0, size.width, size.height);
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    [super dismissViewControllerAnimated:flag completion:completion];
    
    [NSNotificationCenter.defaultCenter postNotificationName:@"dissMissVC" object:nil];
}

@end
