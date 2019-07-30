//
//  ESKNetworkService.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKNetworkService.h"
#import "ESKNetworkHelper.h"

@interface ESKNetworkService ()

@property (nonatomic, strong) NSURLSession *urlSession;/**< Описание свойства */

@end

@implementation ESKNetworkService

+ (ESKNetworkService *)sharedInstance {
    static ESKNetworkService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        [sessionConfiguration setAllowsCellularAccess:YES];
        sharedInstance.urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:nil delegateQueue:nil];
    });
    return sharedInstance;
}

- (void)downloadPostsWithOffset:(NSInteger)offset limit:(NSInteger)limit
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[ESKNetworkHelper getPostsURLWithOffset:offset limir:limit]]];
    [request setTimeoutInterval:40];
    [request setValue:self.apiToken forHTTPHeaderField:@"Authorization"];
    
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
                if (((NSHTTPURLResponse *)response).statusCode != 401)
                {
                    [self.wallOutput getWrongTokenResponseWithCompilition:^{
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
    NSURL *url = [NSURL URLWithString:[ESKNetworkHelper getImageURLForImageID:imageID]];
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
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[ESKNetworkHelper getPostsURLForPostID:@"5d4060066b2ab193b1ec4455"]]];
    [request setTimeoutInterval:40];
    [request setValue:self.apiToken forHTTPHeaderField:@"Authorization"];
    
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
                if (((NSHTTPURLResponse *)response).statusCode != 401)
                {
                    [self.wallOutput getWrongTokenResponseWithCompilition:^{
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

@end
