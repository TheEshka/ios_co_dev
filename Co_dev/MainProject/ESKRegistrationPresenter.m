//
//  ESKRegistrationPresenter.m
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKRegistrationPresenter.h"
//#import "ESKNetworkService.h"
#import "ESKUser.h"
#import "ESKUserDefaultsConstants.h"


@implementation ESKRegistrationPresenter

#pragma mark - RegistrationViewDelegate

- (void)registrationButtonPressedWithUserParams:(ESKUser *)user
{
    if (user.email.length == 0 || user.password.length == 0 || user.name.length == 0)
    {
        [self.delegate registrationUnsuccessWithMessage:@"Заполните все поля"];
        return;
    }
    [self.registrationService registerWithUserParams:user];
}


#pragma mark - AuthorizationServiceRegistrationDelegate

- (void)registrationUnsuccessWithError:(NSError *)error {
    [self.delegate registrationUnsuccessWithMessage:@"network error"];
}

- (void)registrationUnsuccessWithResponse:(NSDictionary *)errorMessage {
    [self.delegate registrationUnsuccessWithMessage:errorMessage[@"error"]];
}

- (void)registrationSuccessForUser:(ESKUser *)user
{
    [self.registrationService setToken:user.apiToken];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:user.apiToken forKey:ESKTokenKey];
    [userDefaults setObject:user.email forKey:ESKEmailKey];
    [userDefaults setObject:user.password forKey:ESKPasswordKey];
    [userDefaults setObject:user.userID forKey:ESKUserIDKey];
    [self.delegate registrationSuccess];
}
@end
