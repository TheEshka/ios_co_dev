//
//  ESKNetworkService.h
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESKNetworkServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKNetworkService : NSObject<NetworkServiceIntputProtocol>

@property (nonatomic, strong) NSString *apiToken;

@property (nonatomic, weak) id<NetworkServiceWallOutputProtocol> wallOutput; /**<  */

@property (nonatomic, weak) id<NetworkServiceTeamOutputProtocol> teamOutpur;

/**
 Singleton of ESKNetworkService

 @return instance of ESKNetworkService
 */
+ (ESKNetworkService *)sharedInstance;

@end

NS_ASSUME_NONNULL_END
