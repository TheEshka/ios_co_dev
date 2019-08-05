//
//  ESKProfileViewController.h
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKProfileModelProtocol.h"

@class ESKNetworkService;
NS_ASSUME_NONNULL_BEGIN

@interface ESKProfileViewController : UIViewController

@property (nonatomic, strong) id<ESKProfileModelInput> model;

- (instancetype)initWithNetwotkService:(ESKNetworkService *)netwotkService;

@end

NS_ASSUME_NONNULL_END
