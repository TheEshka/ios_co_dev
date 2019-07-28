//
//  ESKProfileProtocols.h
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol ESKProfileViewDelegate <NSObject>

- (void)exitButtonPressed;


@end


@protocol ESKProfileViewPresenter <NSObject>

- (BOOL)isCustomerAuthorized;
- (void)deleteUserData;

@end
