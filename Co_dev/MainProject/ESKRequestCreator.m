//
//  ESKRequestCreater.m
//  MainProject
//
//  Created by Gagik on 05/08/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKRequestCreator.h"
#import "ESKUser.h"

@implementation ESKRequestCreator

static NSString * const ESKServerAddress = @"http://10.42.0.128:8080/api";
static NSString * const ESKRegistrationRoute = @"/register";
static NSString * const ESKAuthorizationRoute = @"/login";
static NSString * const ESKPostsRoute = @"/posts";
static NSString * const ESKImageRoute = @"/image";
static NSString * const ESKUsersRoute = @"/users";

- (NSURLRequest *)downloadPostsRequestOffset:(NSInteger)offset limit:(NSInteger)limit
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@?offset=%ld&limit=%ld", ESKServerAddress, ESKPostsRoute, offset, limit]]];
    [request setTimeoutInterval:self.stantartTimeout];
    [request setValue:self.apiToken forHTTPHeaderField:@"Authorization"];
    return request;
}

- (NSURL *)downloadImageURLForID:(NSString *)imageID
{
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@", ESKServerAddress, ESKImageRoute, imageID]];
}

- (NSURLRequest *)downloadPostRequestForID:(NSString *)postID
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@", ESKServerAddress, ESKPostsRoute, postID]]];
    [request setTimeoutInterval:self.stantartTimeout];
    [request setValue:self.apiToken forHTTPHeaderField:@"Authorization"];
    return request;
}

- (NSURLRequest *)downloadUserInfoRequestForID:(NSString *)userID
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@", ESKServerAddress, ESKUsersRoute, userID]]];
    [request setTimeoutInterval:self.stantartTimeout];
    [request setValue:self.apiToken forHTTPHeaderField:@"Authorization"];
    return request;
}

- (NSURLRequest *)authorizeRequestUserParams:(ESKUser *)user
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", ESKServerAddress, ESKAuthorizationRoute]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:self.stantartTimeout];
    NSDictionary *requestBody = @{
                                  @"email": user.email ?: @"",
                                  @"password": user.password ?: @""
                                  };
    [request setHTTPBody: [NSJSONSerialization dataWithJSONObject:requestBody options:kNilOptions error:nil]];
    return request;
}

- (NSURLRequest *)registrateRequestUserParams:(ESKUser *)user
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", ESKServerAddress, ESKRegistrationRoute]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
    NSDictionary *requestBody = @{
                                  @"email": user.email ?: @"",
                                  @"name": user.name ?: @"",
                                  @"password": user.password ?: @""
                                  };
    [request setHTTPBody: [NSJSONSerialization dataWithJSONObject:requestBody options:kNilOptions error:nil]];
    return request;
}

- (NSURLRequest *)changeProfileInfoRequest:(ESKUser *)user
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", ESKServerAddress, ESKUsersRoute]]];
    [request setHTTPMethod:@"PUT"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:self.apiToken forHTTPHeaderField:@"Authorization"];
    [request setTimeoutInterval:15];
    NSDictionary *requestBody = @{
                                  @"city": user.city ?: @"",
                                  @"githubLink": user.githubLink ?: @"",
                                  @"aboutMe": user.aboutMe
                                  };
    [request setHTTPBody: [NSJSONSerialization dataWithJSONObject:requestBody options:kNilOptions error:nil]];
    return request;
}

@end
