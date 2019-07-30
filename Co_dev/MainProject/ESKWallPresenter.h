//
//  ESKWallPresenter.h
//  MainProject
//
//  Created by Gagik on 29/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESKWallViewProtocols.h"
#import "ESKWallModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKWallPresenter : NSObject<ESKWallViewPresenter, ESKWallModelOutput>

@property (nonatomic, strong) id<ESKWallModelInput> model;
@property (nonatomic, weak) id<ESKWallPresenterDelegate> viewController;

@end

NS_ASSUME_NONNULL_END
