//
//  AuthorizationService.m
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKAuthorizationService.h"
#import "ESKUser.h"

//#define AUTHORIZATION_REQUEST 1
//#define REGISTRATION_REQUEST 2

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
        [sessionConfiguration setHTTPAdditionalHeaders:@{ @"Accept" : @"application/json" }];
        sharedInstance.urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:sharedInstance delegateQueue:nil];
    });
    
    return sharedInstance;
}


#pragma mark ESKAuthorizationServiceIntputProtocol

- (void)authorizeWithUserParams:(ESKUser *)user
{
    NSString *authURL = @"http://127.0.0.1:8080/api/login";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:authURL]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:15];
    NSDictionary *requestBody = @{
                                  @"email": user.email,
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
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.authorizationDelegate authorizationUnsuccessWithResponse:@{
                                                                  @"error": @"Server response json error",
                                                                  }];
            });
            return;
        }

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
//- (void)registerWithEmail:(NSString *)email andPassword:(NSString *)password
{
    NSString *authURL = @"http://127.0.0.1:8080/api/register";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:authURL]];
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
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.registrationDelegate registrationUnsuccessWithResponse:@{
                                                                  @"error": @"Server response json error",
                                                                  }];
            });
            return;
        }
        
        if ( ((NSHTTPURLResponse *)response).statusCode != 201 )
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



//#pragma mark - NSURLSessionTaskDelegate
//
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
//didCompleteWithError:(nullable NSError *)error
//{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.authorizationDelegate authorizationUnsuccessWithError: error];
//    });
//    return;
//}
//
//
//#pragma mark - NSURLSessionDataDelegate
//
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
//didReceiveResponse:(NSURLResponse *)response
// completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
//{
//    
//}
//
//
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
//    didReceiveData:(NSData *)data
//{
//    NSError *error;
//    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//    if (error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.output authorizationUnsuccessWithResponse:@{
//                                                              @"error": @"Server error",
//                                                              }];
//        });
//        return;
//    }
//    
//    NSHTTPURLResponse *response =(NSHTTPURLResponse *)dataTask.response;
//    if (response.statusCode != 200  && response.statusCode != 201)
//    {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.output authorizationUnsuccessWithResponse:responseDictionary];
//        });
//        return;
//    }
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.output authorizationSuccessWithResponse:responseDictionary andHeaders:response.allHeaderFields];
//    });
//}

@end
