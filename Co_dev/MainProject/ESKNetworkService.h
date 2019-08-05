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

@interface ESKNetworkService : NSObject<ESKNetworkServiceIntputProtocol, ESKNetworkRegistrate, ESKNetworkAuthenticate, ESKNetworkTokenSetter>

@property (nonatomic, weak) id<ESKNetworkServiceWallOutputProtocol> wallOutput; /**<  */

@property (nonatomic, weak) id<ESKNetworkServiceTeamOutputProtocol> teamOutpur;

@property (nonatomic, weak) id<ESKNetworkServiceProfileOutputProtocol> profileOutpur;

/**
 Delegate implement methods from authorization service for registration requests
 */
@property (nonatomic, nullable, weak) id<ESKNetworkAuthenticateDelegate> authorizationDelegate;

/**
 Delegate implement methods from authorization service for authorization requests
 */
@property (nonatomic, nullable, weak) id<ESKNetworkRegistrationDelegate> registrationDelegate;

@end

NS_ASSUME_NONNULL_END
