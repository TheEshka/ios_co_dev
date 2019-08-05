//
//  User.m
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKUser.h"
#import "ESKPost.h"

@implementation ESKUser

+ (ESKUser *)userFromDictionary:(NSDictionary *)dictionary
{
    ESKUser *user = [ESKUser new];
    user.userID = dictionary[@"id"];
    user.name = dictionary[@"name"];
    user.email = dictionary[@"email"];
    user.city = dictionary[@"info.city"];
    user.githubLink = dictionary[@"info.githubLink"];
    user.aboutMe = dictionary[@"info.aboutMe"];
    if (dictionary[@"info.authorPosts"])
    {
        user.authorPost = [ESKPost postFromDictionary:dictionary[@"info.authorPosts"]];
    }
    return user;
}

@end
