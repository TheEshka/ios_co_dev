//
//  ESKUserDefaultsHelper.h
//  MainProject
//
//  Created by Gagik on 20/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const ESKtokenKey = @"APIToken";
static NSString *const ESKEmailKey = @"Email";
static NSString *const ESKPasswordKey = @"Password";
static NSString *const ESKUserIDKey = @"UserID";
static NSString *const ESKNameKey = @"Name";

@interface ESKUserDefaultsHelper : NSObject

@end

NS_ASSUME_NONNULL_END
