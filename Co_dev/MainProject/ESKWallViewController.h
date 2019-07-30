//
//  ESKWallViewController.h
//  MainProject
//
//  Created by Gagik on 27/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKWallViewProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKWallViewController : UICollectionViewController<ESKWallPresenterDelegate>

@property (nonatomic, strong) id<ESKWallViewPresenter> presenter;

@end

NS_ASSUME_NONNULL_END
