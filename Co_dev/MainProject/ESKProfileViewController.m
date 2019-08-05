//
//  ESKProfileViewController.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKProfileViewController.h"
#import "ESKProfileView.h"
#import "ESKProfileViewProtocols.h"
#import "ESKAuthenticationViewController.h"
#import "ESKProfileModel.h"
#import "ESKProfileTableCell.h"
#import "ESKNetworkService.h"

@interface ESKProfileViewController ()<ESKProfileViewDelegate, ESKProfileModelIOutput, UITableViewDataSource, UITableViewDelegate>

//@property (nonatomic, strong) ESKUser *user;

@property (nonatomic, strong) ESKProfileView *profileView;
@property (nonatomic, strong) ESKAuthenticationViewController *authenticationViewController;

@end

@implementation ESKProfileViewController

- (instancetype)initWithNetwotkService:(ESKNetworkService *)netwotkService
{
    self = [super init];
    if (self) {
        ESKProfileView *profileView = [[ESKProfileView alloc] init];
        ESKProfileModel *model = [ESKProfileModel new];
        profileView.delegate = self;
        [profileView setTableViewDelegate:self];
        [profileView setTableViewDataSource:self];
        netwotkService.profileOutpur = model;
        model.networkService = netwotkService;
        model.delegate = self;
        self.model = model;
        self.profileView = profileView;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.profileView.frame = self.view.frame;
    self.view = self.profileView;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissHandler) name:@"dissMissVC" object:nil];

    if (![self.model isCustomerAuthorized])
    {
        [self presentViewController:self.authenticationViewController animated:YES completion:nil];
        return;
    }
    [self.model loadUserInformation];
}


#pragma mark - ESKProfileModelIOutput

- (void)infotmationDidChange
{
    [self.profileView rebuildProfileInformation];
}


#pragma mark - ESKProfileViewDelegate

- (void)exitButtonPressed
{
    [self.model deleteUserData];
    [self presentViewController:self.authenticationViewController animated:YES completion:nil];
}

- (void)cancelAllChanges {
    [self.model refreshInformation];
}

- (void)userInfoChangingRequest {
    [self.model updateUserInformation];
}

- (void)changeValue:(NSString *)value inRow:(NSInteger)number {
    [self.model changeModelValue:value forItem:number];
}


#pragma mark - Notification observer method

- (void)dismissHandler
{
    self.authenticationViewController = nil;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.model userInfoCount];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.model userInfoTitleForSection:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ESKProfileTableCell *cell = (ESKProfileTableCell *)[tableView dequeueReusableCellWithIdentifier:userInfoCell forIndexPath:indexPath];
    [cell setStartValue:[self.model userInfoValueForRow:indexPath.section]];
    [cell setTextViewDelegate:self.profileView];
    [cell setTextValueIndexPath:indexPath];
    return cell;
}


#pragma mark - Lazy Getters

- (ESKAuthenticationViewController *)authenticationViewController
{
    if(!_authenticationViewController)
    {
        ESKNetworkService *networkService = (ESKNetworkService *)((ESKProfileModel *)self.model).networkService;
        _authenticationViewController = [[ESKAuthenticationViewController alloc] initWithAuthenticateServie:networkService];
    }
    return _authenticationViewController;
}


//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
//{
//    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//    [self.view layoutIfNeeded];
//}

@end
