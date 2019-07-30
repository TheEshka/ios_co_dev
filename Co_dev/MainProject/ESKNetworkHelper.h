//
//  ESKNetworkHelper.h
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ESKPost;
@class ESKUser;


NS_ASSUME_NONNULL_BEGIN

@interface ESKNetworkHelper : NSObject

+ (NSData *)getCreatePostRequestJSONWithPost:(ESKPost *)post;

+ (NSData *)registrationUserRequestJSONWithUser:(ESKUser *)user;

+ (NSString *)registrationURL;

+ (NSString *)autorizationURL;

+ (NSString *)getImageURLForImageID:(NSString *)imageID;

+ (NSString *)createPostURL;

+ (NSString *)getPostsURLWithOffset:(NSInteger)offset limir:(NSInteger)limit;

+ (NSString *)getPostsURLForPostID:(NSString *)postID;

+ (NSString *)setImageURLForPostID:(NSString *)postID;

+ (NSString *)getUserURLForUSerID:(NSString *)userID;

@end

NS_ASSUME_NONNULL_END
