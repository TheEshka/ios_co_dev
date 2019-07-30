//
//  ESKCloseView.h
//  MainProject
//
//  Created by Gagik on 21/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKCloseViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKDraggingCloseView : UIView

@property (nonatomic, weak) id<ESKCloseDraggableViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
