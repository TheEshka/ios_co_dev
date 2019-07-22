//
//  RegistrationViewController.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistrationProtocol.h"
#import "AuthorizationService.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegistrationViewController : UIViewController

- (instancetype)initWithViewAuthorizationService:(AuthorizationService *)authorizationService;

@end

NS_ASSUME_NONNULL_END
