//
//  ESKMyTeamController.h
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKTeamViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKMyTeamController : UITableViewController

@property (nonatomic, strong) id<ESKTeamViewPresenter> presenter;

@end

NS_ASSUME_NONNULL_END
