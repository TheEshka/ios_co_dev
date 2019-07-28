//
//  AuthenticationView.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKAuthenticationProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKAuthenticationView : UIView<ESKAuthenticationPresenterDelegate>

@property (nonatomic, weak) id<ESKAuthenticationViewDelegate> delegate;

@property (nonatomic, strong) id<ESKAuthenticationViewPresenter> presenter;

@end

NS_ASSUME_NONNULL_END
