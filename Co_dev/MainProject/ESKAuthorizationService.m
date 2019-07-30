//
//  AuthorizationService.m
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKAuthorizationService.h"
#import "ESKUser.h"
#import "ESKNetworkHelper.h"

@interface ESKAuthorizationService ()<NSURLSessionDataDelegate, NSURLSessionTaskDelegate>

@property (nonatomic, strong) NSURLSession *urlSession;/**< Описание свойства */

@end

@implementation ESKAuthorizationService

+ (ESKAuthorizationService *)sharedInstance {
    static ESKAuthorizationService *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        [sessionConfiguration setAllowsCellularAccess:YES];
        sharedInstance.urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:sharedInstance delegateQueue:nil];
    });
    
    return sharedInstance;
}


#pragma mark ESKAuthorizationServiceIntputProtocol

- (void)authorizeWithUserParams:(ESKUser *)user
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[ESKNetworkHelper autorizationURL]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
    NSDictionary *requestBody = @{
                                  @"email": user.email ?: @"",
                                  @"password": user.password
                                  };
    [request setHTTPBody: [NSJSONSerialization dataWithJSONObject:requestBody options:kNilOptions error:nil]];
    
    NSURLSessionDataTask *authTask = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.authorizationDelegate authorizationUnsuccessWithError: error];
            });
            return;
        }
        
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if ( ((NSHTTPURLResponse *)response).statusCode != 200 )
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.authorizationDelegate authorizationUnsuccessWithResponse:responseDictionary];
            });
            return;
        }
        
        user.apiToken = ((NSHTTPURLResponse *)response).allHeaderFields[@"Authorization"];
        user.email = responseDictionary[@"email"];
        user.name = responseDictionary[@"name"];
        user.userID = responseDictionary[@"id"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.authorizationDelegate authorizationSuccessForUser:user];
        });
        
    }];
    
    [authTask resume];
}

- (void)registerWithUserParams:(ESKUser *)user
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[ESKNetworkHelper registrationURL]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
    NSDictionary *requestBody = @{
                                  @"email": user.email,
                                  @"name": user.name,
                                  @"password": user.password
                                  };
    [request setHTTPBody: [NSJSONSerialization dataWithJSONObject:requestBody options:kNilOptions error:nil]];
    
    NSURLSessionDataTask *registrationTask = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.registrationDelegate registrationUnsuccessWithError:error];
            });
            return;
        }
        
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if ( ((NSHTTPURLResponse *)response).statusCode != 201)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.registrationDelegate registrationUnsuccessWithResponse:responseDictionary];
            });
            return;
        }
        
        user.email = responseDictionary[@"email"];
        user.userID = responseDictionary[@"id"];
        user.apiToken = ((NSHTTPURLResponse *)response).allHeaderFields[@"Authorization"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.registrationDelegate registrationSuccessForUser:user];
        });
    }];
    [registrationTask resume];
}

@end
