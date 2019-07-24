//
//  ESKTabBarCollectionView.h
//  MainProject
//
//  Created by Gagik on 24/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKTabBatProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKTabBarCollectionView : UICollectionView

@property (nonatomic, weak)id<ESKTabBarCollectionViewGestureDelegate> gestureDelegate;

@end

NS_ASSUME_NONNULL_END
