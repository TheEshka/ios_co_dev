//
//  Presenter.m
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKProfileModel.h"
#import "ESKUserDefaultsConstants.h"
#import "ESKUser.h"

@interface ESKProfileModel ()

@property (nonatomic, strong) NSArray<NSString *> *infoTitles;
@property (nonatomic, strong) NSMutableArray<NSString *> *infoValues;

@property (nonatomic, strong) ESKUser *profileUser;

@end

@implementation ESKProfileModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _infoTitles = @[@"EMAIL", @"NAME", @"CITY", @"GIT LINK", @"ABOUT ME"];
        _infoValues = [NSMutableArray new];
    }
    return self;
}


- (NSInteger)userInfoCount
{
    return [self.infoValues count];
}

- (NSString *)userInfoValueForRow:(NSInteger)number
{
    return self.infoValues[number];
}

- (NSString *)userInfoTitleForSection:(NSInteger)number {
    return self.infoTitles[number];
}


- (BOOL)isCustomerAuthorized
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (![userDefaults objectForKey:ESKTokenKey]){
        return NO;
    }
    return YES;
}

- (void)deleteUserData
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:ESKEmailKey];
    [userDefaults removeObjectForKey:ESKPasswordKey];
    [userDefaults removeObjectForKey:ESKTokenKey];
    [userDefaults removeObjectForKey:ESKUserIDKey];
}

- (void)changeModelValue:(NSString *)value forItem:(NSInteger)number
{
    self.infoValues[number] = value;
}

- (void)refreshInformation
{
    [self.infoValues removeAllObjects];
    [self.infoValues addObject:self.profileUser.name ? : @""];
    [self.infoValues addObject:self.profileUser.email ? : @""];
    [self.infoValues addObject:self.profileUser.city ? : @""];
    [self.infoValues addObject:self.profileUser.githubLink ? : @""];
    [self.infoValues addObject:self.profileUser.aboutMe ? : @""];
    [self.delegate infotmationDidChange];
}

- (void)loadUserInformation
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userID = [userDefaults valueForKey:ESKUserIDKey];
    [self.networkService downloadInfoOfUser:userID];
}

- (void)updateUserInformation
{
    ESKUser *user = [ESKUser new];
    user.city = self.infoValues[2];
    user.githubLink = self.infoValues[3];
    user.aboutMe = self.infoValues[4];
    [self.networkService changeProfileInfoWithParams:user];
}


#pragma mark - ESKNetworkServiceProfileOutputProtocol

- (void)profileDidDownload:(NSDictionary *)userDictionary {
    ESKUser *user = [ESKUser new];
    user.name = userDictionary[@"name"];
    user.email = userDictionary[@"email"];
    user.city = userDictionary[@"info"][@"city"];
    user.githubLink = userDictionary[@"info"][@"githubLink"];
    user.aboutMe = userDictionary[@"info"][@"aboutMe"];
    self.profileUser = user;
    [self refreshInformation];
}



- (void)downloadFromCoreData {
    
}
@end
