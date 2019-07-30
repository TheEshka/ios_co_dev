//
//  ESKWallModel.h
//  MainProject
//
//  Created by Gagik on 29/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESKWallModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKWallModel : NSObject<ESKWallModelInput>

@property (nonatomic, weak) id<ESKWallModelOutput> changeDelegate;

@end

NS_ASSUME_NONNULL_END
