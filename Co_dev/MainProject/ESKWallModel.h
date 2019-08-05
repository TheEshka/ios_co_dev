//
//  ESKWallModel.h
//  MainProject
//
//  Created by Gagik on 29/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESKWallModelProtocol.h"
#import "ESKNetworkService.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKWallModel : NSObject<ESKWallModelInput, ESKNetworkServiceWallOutputProtocol>

@property (nonatomic, weak) id<ESKWallModelOutput> delegate;

@property (nonatomic, strong) ESKNetworkService *networkService;

@end

NS_ASSUME_NONNULL_END
