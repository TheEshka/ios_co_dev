//
//  ESKNetworkHelper.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKNetworkHelper.h"
#import "ESKNetworkConstants.h"
#import "ESKUser.h"
#import "ESKPost.h"



@implementation ESKNetworkHelper

+ (NSData *)getCreatePostRequestJSONWithPost:(ESKPost *)post
{
    NSDictionary *request = @{
                              @"title": post.postTitle ? : @"",
                              @"subject": post.postSubject ? : @"",
                              @"description": post.postDescription ? : @""
                              };
    NSData *json = [NSJSONSerialization dataWithJSONObject:request options:NSJSONWritingPrettyPrinted error:nil];
    return json;
}

+ (NSData *)registrationUserRequestJSONWithUser:(ESKUser *)user
{
    NSDictionary *request = @{
                              @"name": user.name ? : @"",
                              @"email": user.email ? : @"",
                              @"password": user.password ? : @""
                              };
    NSData *json = [NSJSONSerialization dataWithJSONObject:request options:NSJSONWritingPrettyPrinted error:nil];
    return json;
}

+ (NSString *)registrationURL
{
    return [NSString stringWithFormat:@"%@%@", ESKServerAddress, ESKRegistrationRoute];
}

+ (NSString *)autorizationURL
{
    return [NSString stringWithFormat:@"%@%@", ESKServerAddress, ESKAuthorizationRoute];
}

+ (NSString *)getImageURLForImageID:(NSString *)imageID
{
    return [NSString stringWithFormat:@"%@%@/%@", ESKServerAddress, ESKImageRoute, imageID];
}

+ (NSString *)createPostURL
{
    return [NSString stringWithFormat:@"%@%@", ESKServerAddress, ESKPostsRoute];
}

+ (NSString *)getPostsURLWithOffset:(NSInteger)offset limir:(NSInteger)limit
{
    return [NSString stringWithFormat:@"%@%@?offset=%ld&limit=%ld", ESKServerAddress, ESKPostsRoute, offset, limit];
}

+ (NSString *)setImageURLForPostID:(NSString *)postID
{
    return [NSString stringWithFormat:@"%@%@/%@%@", ESKServerAddress, ESKPostsRoute, postID, ESKImageRoute];
}

+ (NSString *)getPostsURLForPostID:(NSString *)postID
{
    return [NSString stringWithFormat:@"%@%@/%@", ESKServerAddress, ESKPostsRoute, postID];
}

+ (NSString *)getUserURLForUSerID:(NSString *)userID
{
    return [NSString stringWithFormat:@"%@%@/%@", ESKServerAddress, ESKUsersRoute, userID];
}




@end
