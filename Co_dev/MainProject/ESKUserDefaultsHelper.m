//
//  ESKUserDefaultsHelper.m
//  MainProject
//
//  Created by Gagik on 20/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKUserDefaultsHelper.h"

static NSString *const ESKtokenKey = @"APIToken";
static NSString *const ESKEmail = @"Email";
static NSString *const ESKpassword = @"Password";

@implementation ESKUserDefaultsHelper

+ (void)addAPIToken:(NSString *)apiToken forEmail:(NSString *)email andPassword:(NSString *)password
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:apiToken forKey:ESKtokenKey];
    [userDefaults setObject:email forKey:ESKEmail];
    [userDefaults setObject:password forKey:ESKpassword];
}

+ (void)changeAPIToken:(NSString *)apiToken
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:apiToken forKey:ESKtokenKey];
}

+ (NSString *)getAPIToken
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *qwe = [userDefaults objectForKey:ESKtokenKey];
    return qwe;
}



@end
