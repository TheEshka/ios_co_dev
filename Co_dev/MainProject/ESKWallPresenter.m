//
//  ESKWallPresenter.m
//  MainProject
//
//  Created by Gagik on 29/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKWallPresenter.h"
#import "ESKUserDefaultsConstants.h"
#import "ESKUser.h"
#import "ESKNetworkServiceProtocol.h"

@interface ESKWallPresenter ()

@property (nonatomic, assign) NSInteger postEveryQuery;

@end

@implementation ESKWallPresenter


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.postEveryQuery = 4;
    }
    return self;
}


#pragma mark - ESKWallViewPresenter

- (ESKPost *)getPostForItem:(NSInteger)number
{
    return [self.model downloadedPostForItem:number];
}

- (NSInteger)presentedPostsCount
{
    return [self.model downloadedPostsCount];
}

- (void)getNextPosts
{
    [self.model getPostsWithOffset:[self presentedPostsCount] limit:self.postEveryQuery];
}

- (void)getImadeWithID:(NSString *)imageID
{
    [self.model getImageWithID:imageID];
}


#pragma mark - ESKWallModelOutput

//- (void)refreshTokenRequest
//{
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    ESKUser *user = [ESKUser new];
//    user.email = [userDefaults objectForKey:ESKEmailKey];
//    user.password = [userDefaults objectForKey:ESKPasswordKey];
//}


- (void)postsDidSave
{
    [self.viewController triggerViewController];
}

- (void)showDownloadedImageWithData:(NSData *)data forItem:(NSInteger)number
{
    [self.viewController setImage:data forItem:number];
}


//#pragma mark - ESKAuthorizationServiceAuthethicationDelegate
//- (void)authorizationSuccessForUser:(ESKUser *)user
//{
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    [userDefaults setObject:user.apiToken forKey:ESKTokenKey];
//    [userDefaults setObject:user.email forKey:ESKEmailKey];
//    [userDefaults setObject:user.password forKey:ESKPasswordKey];
//    [userDefaults setObject:user.userID forKey:ESKUserIDKey];
//    [self.model tokenDidRefresh:user.apiToken];
//}
//
//- (void)authorizationUnsuccessWithError:(NSError *)error {
//    
//}
//
//
//- (void)authorizationUnsuccessWithResponse:(NSDictionary *)errorMessage {
//    
//}


@end
