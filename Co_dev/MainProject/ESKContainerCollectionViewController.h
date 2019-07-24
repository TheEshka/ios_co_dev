//
//  ESKContainerCollectionViewController.h
//  MainProject
//
//  Created by Gagik on 24/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKContainerCollectionViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKContainerCollectionViewController : UIViewController

@property (nonatomic, weak)id<ESKContainerCollectionViewControllerDelegate> delegate;

- (void)addViewController:(UIViewController *)childController;

- (void)openViewControllerNumber:(NSInteger)num;

@end

NS_ASSUME_NONNULL_END
