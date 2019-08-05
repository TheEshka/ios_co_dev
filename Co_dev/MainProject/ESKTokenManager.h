//
//  TokenManager.h
//  MainProject
//
//  Created by Gagik on 04/08/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESKNetworkServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKTokenManager : NSObject<ESKNetworkAuthenticateDelegate>

@property (nonatomic, weak) id<ESKNetworkAuthenticate, ESKNetworkTokenSetter> authenticateService;

- (void)refreshTokenWithComplition:(void (^)(void))complition;

@end

NS_ASSUME_NONNULL_END
