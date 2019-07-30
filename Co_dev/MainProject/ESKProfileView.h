//
//  ESKAuthorizedProfileView.h
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKProfileViewProtocols.h"

@class ESKUser;


NS_ASSUME_NONNULL_BEGIN


@interface ESKProfileView : UIView

@property (nonatomic, strong) id<ESKProfileViewDelegate> delegate;

- (void)setUser:(ESKUser *)user;

@end

NS_ASSUME_NONNULL_END
