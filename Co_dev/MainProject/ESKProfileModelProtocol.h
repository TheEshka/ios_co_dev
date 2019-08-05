//
//  ESKProfileModelProtocol.h
//  MainProject
//
//  Created by Gagik on 05/08/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol ESKProfileModelIOutput <NSObject>

- (void)infotmationDidChange;

@end


@protocol ESKProfileModelInput <NSObject>


- (NSInteger)userInfoCount;
- (NSString *)userInfoTitleForSection:(NSInteger)number;
- (NSString *)userInfoValueForRow:(NSInteger)number;

- (void)changeModelValue:(NSString *)value forItem:(NSInteger)number;

- (void)refreshInformation;

- (void)loadUserInformation;

- (void)updateUserInformation;


/**
 Check if is exist apiToken in NSUserDefaults
 
 @return YES if exist, else NO
 */
- (BOOL)isCustomerAuthorized;

/**
 Delete User info from NSUserDefaults
 */
- (void)deleteUserData;

@end

