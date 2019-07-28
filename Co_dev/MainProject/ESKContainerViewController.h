//
//  ESKContainerViewController.h
//  MainProject
//
//  Created by Gagik on 23/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESKContainerViewController : UIViewController

- (void)addContentViewController:(UIViewController *)viewController forTitle:(NSString *)title;

- (void)setStartViewController:(NSInteger)number;

@end

NS_ASSUME_NONNULL_END
