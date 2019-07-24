//
//  ESKTabBar.h
//  MainProject
//
//  Created by Gagik on 23/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKTabBatProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKTabBar : UIViewController<ESKTabBarCollectionViewGestureDelegate>

@property (nonatomic, weak)id<ESKTabBarDelegate> delegate;


- (void)selectDelegatedItemNumber:(NSInteger)num;

- (void)addItemWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
