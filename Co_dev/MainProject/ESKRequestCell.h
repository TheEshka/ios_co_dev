//
//  ESKRequestCell.h
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKTeamViewProtocol.h"

@class ESKUser;
NS_ASSUME_NONNULL_BEGIN

@interface ESKRequestCell : UITableViewCell

@property (nonatomic, strong) ESKUser *user;

@property (nonatomic, weak) id<ESKTeamViewDelegat> delegate;

- (void)setUser:(ESKUser *)user;

@end

NS_ASSUME_NONNULL_END
