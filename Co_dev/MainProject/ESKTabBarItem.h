//
//  ESKTabBarItem.h
//  MainProject
//
//  Created by Gagik on 23/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKTabBatProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKTabBarItem : UICollectionViewCell<ESKTabBarItemInput>

@property (nonatomic, strong) NSString *name;

- (void)setName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
