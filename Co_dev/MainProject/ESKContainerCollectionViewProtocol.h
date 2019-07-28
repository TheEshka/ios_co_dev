//
//  ESKContainerCollectionViewProtocol.h
//  MainProject
//
//  Created by Gagik on 24/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol ESKContainerCollectionViewControllerDelegate <NSObject>

/**
 Tells the delegate that containetCollectonView page has changed to another item

 @param number item number starting from 0
 */
- (void)collectionViewChangedPageTo:(NSInteger)number;

@end
