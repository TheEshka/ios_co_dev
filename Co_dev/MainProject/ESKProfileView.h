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

static NSString * const userInfoCell = @"userInfoCell";

@interface ESKProfileView : UIView<UITextViewDelegate>

@property (nonatomic, strong) id<ESKProfileViewDelegate> delegate;

- (void)rebuildProfileInformation;

- (void)setTableViewDataSource:(id<UITableViewDataSource>)controller;

- (void)setTableViewDelegate:(id<UITableViewDelegate>)controller;

@end

NS_ASSUME_NONNULL_END
