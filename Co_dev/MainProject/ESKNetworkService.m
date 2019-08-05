//
//  ESKNetworkService.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKNetworkService.h"
#import "ESKUser.h"
#import "ESKTokenManager.h"
#import "ESKRequestCreator.h"

@interface ESKNetworkService ()

@property (nonatomic, strong) NSURLSession *urlSession;/**< Описание свойства */

@property (nonatomic, strong) ESKTokenManager *tokenManager;
@property (nonatomic, strong) ESKRequestCreator *requestCreator;

@end

@implementation ESKNetworkService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tokenManager = [ESKTokenManager new];
        self.tokenManager.authenticateService = self;
        
        self.requestCreator = [ESKRequestCreator new];
        self.requestCreator.stantartTimeout = 15;
        
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        [sessionConfiguration setAllowsCellularAccess:YES];
        self.urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:nil delegateQueue:nil];
    }
    return self;
}

- (void)downloadPostsWithOffset:(NSInteger)offset limit:(NSInteger)limit
{
    NSURLRequest *request = [self.requestCreator downloadPostsRequestOffset:offset limit:limit];
    
    NSURLSessionDataTask *registrationTask = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.wallOutput downloadFromCoreData];
            });
            return;
        }
        
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if ( ((NSHTTPURLResponse *)response).statusCode != 200 )
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (((NSHTTPURLResponse *)response).statusCode == 401)
                {
                    self.authorizationDelegate = self.tokenManager;
                    [self.tokenManager refreshTokenWithComplition:^{
                        [self downloadPostsWithOffset:offset limit:limit];
                    }];
                    return;
                }
                [self.wallOutput downloadFromCoreData];
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.wallOutput postsDidDowload:responseDictionary];
        });
    }];
    [registrationTask resume];
}


- (void)downloadImageWithID:(NSString *)imageID
{
    NSURL *url = [self.requestCreator downloadImageURLForID:imageID];
    NSURLSessionDownloadTask *sessionDownloadTask = [self.urlSession downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [NSData dataWithContentsOfURL:location];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.wallOutput loadingPhotoIsDoneWithData:data forPhotoID:imageID];
        });
    }];
    [sessionDownloadTask resume];
}

- (void)getTeam
{
    NSURLRequest *request = [self.requestCreator downloadPostRequestForID:@"5d4060066b2ab193b1ec4455"];
    
    NSURLSessionDataTask *registrationTask = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{

            });
            return;
        }
        
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if ( ((NSHTTPURLResponse *)response).statusCode != 200 )
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (((NSHTTPURLResponse *)response).statusCode == 401)
                {
                    self.authorizationDelegate = self.tokenManager;
                    [self.tokenManager refreshTokenWithComplition:^{
                        [self getTeam];
                    }];
                    return;
                }
                [self.wallOutput downloadFromCoreData];
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.teamOutpur teamDidDownload:responseDictionary];
        });
    }];
    [registrationTask resume];
}

- (void)downloadInfoOfUser:(NSString *)userID
{
    NSURLRequest *request =
    [self.requestCreator downloadUserInfoRequestForID:userID];
    
    NSURLSessionDataTask *registrationTask = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.profileOutpur downloadFromCoreData];
            });
            return;
        }
        
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if ( ((NSHTTPURLResponse *)response).statusCode != 200 )
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (((NSHTTPURLResponse *)response).statusCode == 401)
                {
                    self.authorizationDelegate = self.tokenManager;
                    [self.tokenManager refreshTokenWithComplition:^{
                        [self downloadInfoOfUser:userID];
                    }];
                    return;
                }
                [self.profileOutpur downloadFromCoreData];
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.profileOutpur profileDidDownload:responseDictionary];
        });
        
    }];
    [registrationTask resume];
}


- (void)changeProfileInfoWithParams:(ESKUser *)user
{
    NSURLRequest *request = [self.requestCreator changeProfileInfoRequest:user];
    
    NSURLSessionDataTask *authTask = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.profileOutpur downloadFromCoreData];
            });
            return;
        }
        
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if ( ((NSHTTPURLResponse *)response).statusCode != 200 )
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (((NSHTTPURLResponse *)response).statusCode == 401)
                {
                    self.authorizationDelegate = self.tokenManager;
                    [self.tokenManager refreshTokenWithComplition:^{
                        [self changeProfileInfoWithParams:user];
                    }];
                    return;
                }
                [self.profileOutpur downloadFromCoreData];
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.profileOutpur profileDidDownload:responseDictionary];
        });
        
    }];
    
    [authTask resume];
}


#pragma mark ESKNetworkAuthenticationInput

- (void)authorizeWithUserParams:(ESKUser *)user
{
    NSURLRequest *request = [self.requestCreator authorizeRequestUserParams:user];
    
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


#pragma mark ESKNetworkRegistrationInput

- (void)registerWithUserParams:(ESKUser *)user
{
    NSURLRequest *request = [self.requestCreator registrateRequestUserParams:user];
    
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

- (void)setToken:(NSString *)apiToken {
    self.requestCreator.apiToken = apiToken;
}

@end
