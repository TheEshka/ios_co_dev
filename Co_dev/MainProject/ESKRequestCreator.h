//
//  ESKRequestCreater.h
//  MainProject
//
//  Created by Gagik on 05/08/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ESKUser;
NS_ASSUME_NONNULL_BEGIN

@interface ESKRequestCreator : NSObject

@property (nonatomic, strong) NSString *apiToken;
@property (nonatomic, assign) NSInteger stantartTimeout;

- (NSURLRequest *)downloadPostsRequestOffset:(NSInteger)offset limit:(NSInteger)limit;

- (NSURL *)downloadImageURLForID:(NSString *)imageID;

- (NSURLRequest *)downloadPostRequestForID:(NSString *)postID;

- (NSURLRequest *)downloadUserInfoRequestForID:(NSString *)userID;

- (NSURLRequest *)authorizeRequestUserParams:(ESKUser *)user;

- (NSURLRequest *)registrateRequestUserParams:(ESKUser *)user;

- (NSURLRequest *)changeProfileInfoRequest:(ESKUser *)user;

@end

NS_ASSUME_NONNULL_END
