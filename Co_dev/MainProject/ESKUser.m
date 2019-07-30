//
//  User.m
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKUser.h"

@implementation ESKUser

+ (ESKUser *)userFromDictionary:(NSDictionary *)dictionary
{
    ESKUser *user = [ESKUser new];
    user.userID = dictionary[@"id"];
    user.name = dictionary[@"name"];
    user.email = dictionary[@"email"];
    return user;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.userID forKey:@"id"];
    [aCoder encodeObject:self.userID forKey:@"name"];
    [aCoder encodeObject:self.userID forKey:@"email"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    
    if (self)
    {
        [aDecoder encodeObject:self.userID forKey:@"id"];
        [aDecoder encodeObject:self.userID forKey:@"name"];
        [aDecoder encodeObject:self.userID forKey:@"email"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding
{
    return YES;
}

@end
