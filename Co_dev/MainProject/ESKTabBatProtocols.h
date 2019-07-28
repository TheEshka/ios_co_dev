//
//  ESKTabBatProtocols.h
//  MainProject
//
//  Created by Gagik on 24/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol ESKTabBarItemInput <NSObject>

- (void)itemAnimationFocusing;
- (void)itemAnimationUnfocusing;

@end

@protocol ESKTabBarCollectionViewGestureDelegate <NSObject>

- (void)selectItemNumber:(NSInteger)number;

@end

@protocol ESKTabBarDelegate <NSObject>

- (void)selectedBarItemNumber:(NSInteger)number;

@end
