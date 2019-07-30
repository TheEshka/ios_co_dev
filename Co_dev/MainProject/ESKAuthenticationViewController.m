//
//  AuthenticationViewController.m
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKAuthenticationViewController.h"
#import "ESKAuthenticationView.h"
//#import "ESKAuthenticationProtocols.h"
#import "ESKRegistrationViewController.h"
#import "ESKAuthenticationPresenter.h"


@interface ESKAuthenticationViewController ()<ESKAuthenticationViewDelegate>

@property (nonatomic, strong) ESKAuthenticationView *authenticationView;

@end

@implementation ESKAuthenticationViewController

#pragma mark - ViewController Lify Cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalTransitionStyle = 0;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.definesPresentationContext = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ESKAuthenticationPresenter *presenter = [ESKAuthenticationPresenter new];
    self.authenticationView = [[ESKAuthenticationView alloc] init];
    self.authenticationView.delegate = self;
    self.authenticationView.presenter = presenter;
    presenter.delegate = self.authenticationView;
    
    self.view = self.authenticationView;
}


#pragma mark - ESKAuthenticationViewDelegate

- (void)registrationButtonPressed
{
    ESKRegistrationViewController *registrationViewController = [[ESKRegistrationViewController alloc] init];
//    self.authorizationService.registrationDelegate = registrationViewController;
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
