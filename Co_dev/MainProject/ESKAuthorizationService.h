//
//  AuthorizationService.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESKAuthorizationServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKAuthorizationService : NSObject<ESKAuthorizationServiceIntputProtocol>

/**
 Delegate implement methods from authorization service for registration requests
 */
@property (nonatomic, weak) id<ESKAuthorizationServiceAuthethicationDelegate> authorizationDelegate;

/**
 Delegate implement methods from authorization service for authorization requests
 */
@property (nonatomic, weak) id<ESKAuthorizationServiceRegistrationDelegate> registrationDelegate;


/**
 Singlton of ESKAuthorizationService

 @return ESKAuthorizationService
 */
+ (ESKAuthorizationService *)sharedInstance;

@end

NS_ASSUME_NONNULL_END
