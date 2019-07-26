//
//  AuthenticationView.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKAuthenticationProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKAuthenticationView : UIView<ESKAuthenticationViewActivity>

@property (nonatomic, weak) id<ESKAuthenticationViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
