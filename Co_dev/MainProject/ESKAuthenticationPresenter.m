//
//  ESKAuthenticationPresenter.m
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKAuthenticationPresenter.h"
#import "ESKUser.h"
#import "ESKAuthorizationServiceProtocol.h"
#import "ESKAuthorizationService.h"
#import "ESKUserDefaultsHelper.h"


@interface ESKAuthenticationPresenter ()

//@property (nonatomic, strong) id<ESKAuthorizationServiceIntputProtocol> authenticationService;
@property (nonatomic, strong) ESKAuthorizationService *authenticationService;

@end


@implementation ESKAuthenticationPresenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _authenticationService = [ESKAuthorizationService sharedInstance];
        _authenticationService.authorizationDelegate = self;
    }
    return self;
}

#pragma mark - ESKAuthenticationViewPresenter

- (void)loginButtonPressedWithUserParams:(ESKUser *)user;
{
    if (user.email.length == 0 || user.password.length == 0)
    {
        [self.delegate authorizationUnsuccessWithMessage:@"Заполните все поля"];
        return;
    }
    [self.authenticationService authorizeWithUserParams:user];
}

#pragma mark - ESKAuthorizationServiceAuthorizationDelegate

- (void)authorizationUnsuccessWithError:(NSError *)error
{
    [self.delegate authorizationUnsuccessWithMessage:[error localizedDescription]];
}

- (void)authorizationUnsuccessWithResponse:(NSDictionary *)errorMessage
{
    [self.delegate authorizationUnsuccessWithMessage:errorMessage[@"error"]];
}

- (void)authorizationSuccessForUser:(ESKUser *)user
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:user.apiToken forKey:ESKtokenKey];
    [userDefaults setObject:user.email forKey:ESKEmailKey];
    [userDefaults setObject:user.password forKey:ESKPasswordKey];
    [userDefaults setObject:user.userID forKey:ESKUserIDKey];
    [userDefaults setObject:user.name forKey:ESKNameKey];
    [self.delegate authorizationSuccess];
}

@end
