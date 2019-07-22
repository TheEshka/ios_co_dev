//
//  RegistrationViewController.m
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "RegistrationViewController.h"
#import "RegistrationView.h"
#import "AuthorizationService.h"
#import "ESKUserDefaultsHelper.h"

@interface RegistrationViewController ()<RegistrationViewDelegate, AuthorizationServiceRegistrationDelegate>

@property (nonatomic, strong) AuthorizationService *authorizationService;
@property (nonatomic, strong) RegistrationView *registrationView;

@end

@implementation RegistrationViewController

#pragma mark - Custom initializer

- (instancetype)initWithViewAuthorizationService:(AuthorizationService *)authorizationService
{
    self = [super init];
    if (self) {
        self.authorizationService = authorizationService;
        self.authorizationService.registrationDelegate = self;
    }
    return self;
}


#pragma mark - ViewController Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.registrationView = [[RegistrationView alloc] init];
    self.registrationView.delegate = self;
    
    self.modalTransitionStyle = 0;
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    self.view = self.registrationView;
}


#pragma mark - RegistrationViewDelegate
- (void)registrationButtonPressedWithEmail:(NSString *)email andPassword:(NSString *)password
{
    NSLog(@"Registering with email: %@; and password %@", email, password);
    [self.authorizationService registerWithEmail:email andPassword:password];
}


#pragma mark - AuthorizationServiceRegistrationDelegate

- (void)registrationUnsuccessWithError:(NSError *)error {
    [self.registrationView registrationUnsuccessWithMessage:@"network error"];
}

- (void)registrationUnsuccessWithResponse:(NSDictionary *)errorMessage {
    [self.registrationView registrationUnsuccessWithMessage:errorMessage[@"error"]];
}

- (void)registrationSuccessForEmail:(NSString *)email withPassword:(NSString *)password andToken:(NSString *)token {
    [self.registrationView registrationSuccess];
    [ESKUserDefaultsHelper addAPIToken:token forEmail:email andPassword:password];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - ESKCloseViewDelegate

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
