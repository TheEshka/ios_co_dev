//
//  Presenter.m
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKProfilePresenter.h"
#import "ESKUserDefaultsHelper.h"

@implementation ESKProfilePresenter

- (BOOL)isCustomerAuthorized
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (![userDefaults objectForKey:ESKNameKey]){
        return NO;
    }
    return YES;
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
