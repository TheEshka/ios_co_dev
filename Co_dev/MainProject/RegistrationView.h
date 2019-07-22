//
//  RegistrationView.h
//  MainProject
//
//  Created by Gagik on 09/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistrationProtocol.h"
#import "AuthorizationServiceProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface RegistrationView : UIView<RegistrationViewActivity>

@property (nonatomic, weak) id<RegistrationViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
