//
//  User.h
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESKUser : NSObject<NSSecureCoding>

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *apiToken;

+ (ESKUser *)userFromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
