//
//  ESKWallViewController.h
//  MainProject
//
//  Created by Gagik on 27/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKWallViewProtocols.h"

@class ESKNetworkService;
NS_ASSUME_NONNULL_BEGIN

@interface ESKWallViewController : UICollectionViewController<ESKWallPresenterDelegate>

@property (nonatomic, strong) id<ESKWallViewPresenter> presenter;

- (instancetype)initWithNetworkSerice:(ESKNetworkService *)networkService;

@end

NS_ASSUME_NONNULL_END
