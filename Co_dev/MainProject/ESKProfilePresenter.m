//
//  Presenter.m
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKProfilePresenter.h"
#import "ESKUserDefaultsConstants.h"
#import "ESKUser.h"

@implementation ESKProfilePresenter

- (BOOL)isCustomerAuthorized
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (![userDefaults objectForKey:ESKNameKey]){
        return NO;
    }
    return YES;
}

- (ESKUser *)getProfileInfo
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    ESKUser *user = [ESKUser new];
    user.name = [userDefaults objectForKey:ESKNameKey];
    user.email = [userDefaults objectForKey:ESKEmailKey];
    return user;
}

- (void)deleteUserData
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:ESKNameKey];
    [userDefaults removeObjectForKey:ESKEmailKey];
    [userDefaults removeObjectForKey:ESKPasswordKey];
    [userDefaults removeObjectForKey:ESKtokenKey];
    [userDefaults removeObjectForKey:ESKUserIDKey];
}

@end
