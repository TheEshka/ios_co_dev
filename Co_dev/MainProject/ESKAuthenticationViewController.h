//
//  AuthenticationViewController.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKAuthenticationProtocols.h"

@class ESKNetworkService;
NS_ASSUME_NONNULL_BEGIN

@interface ESKAuthenticationViewController : UIViewController<ESKAuthenticationViewDelegate>

- (instancetype)initWithAuthenticateServie:(ESKNetworkService *)networkService;

@end

NS_ASSUME_NONNULL_END
