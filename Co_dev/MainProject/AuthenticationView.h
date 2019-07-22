//
//  AuthenticationView.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthenticationProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthenticationView : UIView<AuthenticationViewActivity>

@property (nonatomic, weak) id<AuthenticationViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
