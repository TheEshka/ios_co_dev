//
//  RegistrationViewController.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKRegistrationProtocol.h"
#import "ESKAuthorizationService.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKRegistrationViewController : UIViewController<ESKAuthorizationServiceRegistrationDelegate>

/**
 Use this initializer to pass object that implement ESKAuthorizationServiceIntputProtocol for sending requests

 @param authorizationService object that implementn ESKAuthorizationServiceIntputProtocol
 @return instance of ESKRegistrationViewController
 */
- (instancetype)initWithViewAuthorizationService:(id<ESKAuthorizationServiceIntputProtocol>)authorizationService;

@end

NS_ASSUME_NONNULL_END
