//
//  RegistrationView.h
//  MainProject
//
//  Created by Gagik on 09/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKRegistrationProtocol.h"
#import "ESKAuthorizationServiceProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface ESKRegistrationView : UIView<ESKRegistrationViewActivity>


@property (nonatomic, weak) id<ESKRegistrationViewDelegate> delegate;/**< Object that act as delegate of RegistrationView action*/

@end

NS_ASSUME_NONNULL_END
