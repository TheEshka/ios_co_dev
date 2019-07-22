//
//  AuthorizationService.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthorizationServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthorizationService : NSObject<AuthorizationServiceIntputProtocol>

@property (nonatomic, weak) id<AuthorizationServiceAuthothicationDelegate> authorizationDelegate;
@property (nonatomic, weak) id<AuthorizationServiceRegistrationDelegate> registrationDelegate;

@end

NS_ASSUME_NONNULL_END
