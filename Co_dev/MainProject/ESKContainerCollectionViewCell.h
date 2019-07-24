//
//  ESKContainerCollectionViewCell.h
//  MainProject
//
//  Created by Gagik on 23/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESKContainerCollectionViewCell : UICollectionViewCell

@property (nonatomic, nullable, strong) UIView *hostView;
@property (nonatomic, strong) UIViewController *contentViewController;


/**
 Manage container view controller methods (call addChildViewController and didMoveToParentViewController)
 Called from UICollectionViewDelegate methods
 Also allocate cell's ViewController's View into cell

 @param parentViewController ViewController that will containt cell's ViewController
 */
- (void)addViewControllerToParentViewController:(UIViewController *)parentViewController;


/**
 Manage container view controller methods (call addChildViewController and didMoveToParentViewController
 Called from UICollectionViewDelegate methods
 Also remove cell's ViewController's View from cell
 */
- (void)removeViewControllerFromParentViewController;

@end

NS_ASSUME_NONNULL_END
