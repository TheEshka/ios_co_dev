//
//  TokenManager.m
//  MainProject
//
//  Created by Gagik on 04/08/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKTokenManager.h"
#import "ESKNetworkServiceProtocol.h"
#import "ESKUser.h"
#import "ESKUserDefaultsConstants.h"

@interface ESKTokenManager ()

@property (nonatomic, copy, nullable) NSMutableArray<void (^)(void)> *queue;

@end

@implementation ESKTokenManager

- (void)refreshTokenWithComplition:(void (^)(void))complition
{
    [self.queue addObject:complition];
    if ([self.queue count] != 1)
    {
        return;
    }
    ESKUser *user = [ESKUser new];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    user.email = [userDefaults valueForKey:ESKEmailKey];
    user.password = [userDefaults valueForKey:ESKPasswordKey];
    [self.authenticateService authorizeWithUserParams: user];
}

- (void)authorizationSuccessForUser:(ESKUser *)user {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:user.apiToken forKey:ESKTokenKey];
    [self.authenticateService setToken:user.apiToken];
    for (void (^block)(void)  in self.queue)
    {
        block();
    }
}

- (void)authorizationUnsuccessWithError:(NSError *)error {
    // get out of profile
}

- (void)authorizationUnsuccessWithResponse:(NSDictionary *)errorMessage {
    // get out of profile
}


- (NSMutableArray<void (^)(void)> *)queue
{
    if (!_queue)
    {
        _queue = [NSMutableArray new];
    }
    return _queue;
}

@end
