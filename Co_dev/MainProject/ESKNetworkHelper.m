//
//  ESKNetworkHelper.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKNetworkHelper.h"

@implementation ESKNetworkHelper

- (NSData *)getCreatePostRequestJSONWithTitle:(NSString *)title
                                      subject:(NSString *)subject
                                  description:(NSString *)description
{
    NSError *error;
    NSDictionary *request = @{
                              @"title": title,
                              @"subject": subject,
                              @"description": description
                              };
    NSData *json = [NSJSONSerialization dataWithJSONObject:request options:NSJSONWritingPrettyPrinted error:&error];
    if (error)
    {
        NSLog(@"%@", error);
    }
    return json;
}

- (NSData *)getCreateUserRequestJSONWithName:(NSString *)name
                                       email:(NSString *)email
                                    password:(NSString *)password
{
    NSError *error;
    NSDictionary *request = @{
                              @"name": name,
                              @"email": email,
                              @"password": password
                              };
    NSData *json = [NSJSONSerialization dataWithJSONObject:request options:NSJSONWritingPrettyPrinted error:&error];
    if (error)
    {
        NSLog(@"%@", error);
    }
    return json;
}


@end
