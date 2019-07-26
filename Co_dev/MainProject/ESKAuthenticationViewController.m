//
//  AuthenticationViewController.m
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKAuthenticationViewController.h"
#import "ESKAuthenticationView.h"
#import "ESKAuthenticationProtocol.h"
#import "ESKRegistrationViewController.h"
#import "ESKAuthorizationServiceProtocol.h"
#import "ESKAuthorizationService.h"
#import "ESKUserDefaultsHelper.h"


@interface ESKAuthenticationViewController ()<ESKAuthenticationViewDelegate, ESKAuthorizationServiceAuthethicationDelegate>

@property (nonatomic, strong) ESKAuthenticationView *authenticationView;
@property (nonatomic, strong) ESKAuthorizationService *authorizationService;

@end

@implementation ESKAuthenticationViewController

#pragma mark - ViewControllerLifyCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _authenticationView = [[ESKAuthenticationView alloc] init];
    _authenticationView.delegate = self;
    
    self.modalTransitionStyle = 1;
    self.modalPresentationStyle = 0;
    self.view = _authenticationView;
    
    _authorizationService = [[ESKAuthorizationService alloc] init];
    _authorizationService.authorizationDelegate = self;
    [_authorizationService configureUrlSessionWithParams:@{ @"Accept" : @"application/json" }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    NSString *token = [ESKUserDefaultsHelper getAPIToken];
    if (token)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - AuthenticationViewDelegate

- (void)loginButtonPressedWithEmail:(NSString *)email andPassword:(NSString *)password
{
    NSLog(@"loginning with email: %@; and password %@", email, password);
    [self.authorizationService authorizeWithEmail:email andPassword:password];
}

- (void)goToRegistrationButtonPressed
{
    ESKRegistrationViewController *registrationViewController = [[ESKRegistrationViewController alloc] initWithViewAuthorizationService:self.authorizationService];
    self.authorizationService.registrationDelegate = registrationViewController;
    [self presentViewController:registrationViewController animated:YES completion:nil];
}


#pragma mark - AuthorizationServiceAuthorizationDelegate

- (void)authorizationUnsuccessWithError:(NSError *)error
{
    [self.authenticationView authorizationUnsuccessWithMessage:[error localizedDescription]];
}

- (void)authorizationUnsuccessWithResponse:(NSDictionary *)errorMessage
{
    [self.authenticationView authorizationUnsuccessWithMessage:errorMessage[@"error"]];
}

- (void)authorizationSuccessForEmail:(NSString *)email withPassword:(NSString *)password andToken:(NSString *)token {
    [self.authenticationView authorizationSuccess];
    [ESKUserDefaultsHelper addAPIToken:token forEmail:email andPassword:password];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
