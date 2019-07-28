//
//  ESKNetworkService.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKNetworkService.h"

@implementation ESKNetworkService

+ (ESKNetworkService *)sharedInstance {
    static ESKNetworkService *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)configureUrlSessionWithParams:(NSDictionary *)params
{
    
}

- (void)getPostWithOffset:(NSInteger)offset limit:(NSInteger)limit
{
    
}

@end
