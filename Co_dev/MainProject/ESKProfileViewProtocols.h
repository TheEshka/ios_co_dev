//
//  ESKProfileProtocols.h
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//
@class ESKUser;
@protocol ESKProfileViewDelegate <NSObject>

/**
 Tells to delegate(ViewController) that exit button was pressed
 */
- (void)exitButtonPressed;

@end


@protocol ESKProfileViewPresenter <NSObject>
/**
 Check if is exist apiToken in NSUserDefaults

 @return YES if exist, else NO
 */
- (BOOL)isCustomerAuthorized;

/**
 Delete User info from NSUserDefaults
 */
- (void)deleteUserData;

/**
 Dowload from NSUSerDefaults general information

 @return Object ESKUser
 */
- (ESKUser *)getProfileInfo;

@end
