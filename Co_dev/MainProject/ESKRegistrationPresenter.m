//
//  ESKRegistrationPresenter.m
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKRegistrationPresenter.h"
#import "ESKAuthorizationService.h"
#import "ESKUser.h"
#import "ESKUserDefaultsHelper.h"

@interface ESKRegistrationPresenter ()

//@property (nonatomic, strong) id<ESKAuthorizationServiceIntputProtocol> authenticationService;
@property (nonatomic, strong) ESKAuthorizationService *authenticationService;

@end


@implementation ESKRegistrationPresenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _authenticationService = [ESKAuthorizationService sharedInstance];
        _authenticationService.registrationDelegate = self;
    }
    return self;
}

#pragma mark - RegistrationViewDelegate

- (void)registrationButtonPressedWithUserParams:(ESKUser *)user
{
    if (user.email.length == 0 || user.password.length == 0 || user.name.length == 0)
    {
        [self.delegate registrationUnsuccessWithMessage:@"Заполните все поля"];
        return;
    }
    [self.authenticationService registerWithUserParams:user];
}
//

#pragma mark - AuthorizationServiceRegistrationDelegate

- (void)registrationUnsuccessWithError:(NSError *)error {
    [self.delegate registrationUnsuccessWithMessage:@"network error"];
}

- (void)registrationUnsuccessWithResponse:(NSDictionary *)errorMessage {
    [self.delegate registrationUnsuccessWithMessage:errorMessage[@"error"]];
}

- (void)registrationSuccessForUser:(ESKUser *)user
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:user.apiToken forKey:ESKtokenKey];
    [userDefaults setObject:user.email forKey:ESKEmailKey];
    [userDefaults setObject:user.password forKey:ESKPasswordKey];
    [userDefaults setObject:user.userID forKey:ESKUserIDKey];
    [userDefaults setObject:user.name forKey:ESKNameKey];
    [self.delegate registrationSuccess];
}
@end
