//
//  User.h
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ESKImage;
@class ESKPost;
NS_ASSUME_NONNULL_BEGIN

@interface ESKUser : NSObject

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *githubLink;
@property (nonatomic, copy) NSString *aboutMe;
@property (nonatomic, copy) NSString *apiToken;
@property (nonatomic, strong) ESKImage *userImage;
@property (nonatomic, strong) ESKPost *authorPost;
@property (nonatomic, strong) ESKPost *memberPost;

+ (ESKUser *)userFromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
