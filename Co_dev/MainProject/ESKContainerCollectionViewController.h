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

/**
 Adding another ViewController in container. For synchronize with TabBar use onle method from ESKContainerViewController? that will call this method

 @param childController ViewController to add on container
 */
- (void)addViewController:(UIViewController *)childController;


/**
Method for moving to needed page. Celled from from ESKContainerViewController for synchronize TabBar page and collectionView cell

 @param number page number starting from 0
 */
- (void)openViewControllerNumber:(NSInteger)number;



@end

NS_ASSUME_NONNULL_END
