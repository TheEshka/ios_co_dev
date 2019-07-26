//
//  ESKProfileView.h
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKProfileProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKProfileView : UIView

@property (nonatomic, strong) id<ESKProfileViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
