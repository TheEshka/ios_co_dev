//
//  AuthenticationViewController.m
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "AuthenticationViewController.h"
#import "AuthenticationView.h"
#import "AuthenticationProtocol.h"
#import "RegistrationViewController.h"
#import "AuthorizationServiceProtocol.h"
#import "AuthorizationService.h"
#import "ESKUserDefaultsHelper.h"


@interface AuthenticationViewController ()<AuthenticationViewDelegate, AuthorizationServiceAuthothicationDelegate>

@property (nonatomic, strong) AuthenticationView *authenticationView;
@property (nonatomic, strong) AuthorizationService *authorizationService;
@property (nonatomic, strong) RegistrationViewController *registrationViewController;

@end

@implementation AuthenticationViewController

#pragma mark - ViewControllerLifyCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _authenticationView = [[AuthenticationView alloc] init];
    _authenticationView.delegate = self;
    
    self.modalTransitionStyle = 1;
    self.modalPresentationStyle = 0;
    self.view = _authenticationView;
    
    _authorizationService = [[AuthorizationService alloc] init];
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
    [self presentViewController:self.registrationViewController animated:YES completion:nil];
//    [self showViewController:registrationViewController sender:self];
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



#pragma mark - Getter

- (RegistrationViewController *)registrationViewController
{
    if (!_registrationViewController)
    {
        _registrationViewController = [[RegistrationViewController alloc] initWithViewAuthorizationService:self.authorizationService];
    }
    return _registrationViewController;
}

@end
