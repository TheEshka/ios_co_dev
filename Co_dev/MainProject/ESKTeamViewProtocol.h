//
//  ESKTeamProtocol.h
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKConstants.h"

@protocol ESKTeamViewDelegat <NSObject>

- (void)memberRequestAction:(ESKMyTeamRequest)request forUserID:(NSString *)userID;

@end

@protocol ESKTeamViewPresenter <NSObject>

- (void)postAction:(ESKMyTeamRequest)request forUserID:(NSString *)userID;

@end

