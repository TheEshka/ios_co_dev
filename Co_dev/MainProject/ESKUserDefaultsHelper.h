//
//  ESKUserDefaultsHelper.h
//  MainProject
//
//  Created by Gagik on 20/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESKUserDefaultsHelper : NSObject

+ (void)addAPIToken:(NSString *)apiToken forEmail:(NSString *)email andPassword:(NSString *)password;
+ (void)changeAPIToken:(NSString *)apiToken;
+ (NSString *)getAPIToken;

@end

NS_ASSUME_NONNULL_END
