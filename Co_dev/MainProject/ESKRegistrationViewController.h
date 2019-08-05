//
//  RegistrationViewController.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ESKNetworkService;
NS_ASSUME_NONNULL_BEGIN

@interface ESKRegistrationViewController : UIViewController

- (instancetype)initWithRegistrateService:(ESKNetworkService *)networkService;

@end

NS_ASSUME_NONNULL_END
