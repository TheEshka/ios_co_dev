//
//  ESKMyTeamController.m
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKMyTeamController.h"
#import "ESKMemberCell.h"
#import "ESKRequestCell.h"
#import "ESKUser.h"
#import "ESKTeamViewProtocol.h"
#import "ESKNetworkServiceProtocol.h"
#import "ESKNetworkService.h"

@interface ESKMyTeamController ()<ESKTeamViewDelegat, ESKNetworkServiceTeamOutputProtocol>

@property (nonatomic, strong) NSArray<ESKUser *> *membersArray;
@property (nonatomic, strong) NSArray<ESKUser *> *membersRequestArray;

@property (nonatomic, strong) ESKNetworkService *networkService;

@end

@implementation ESKMyTeamController

static NSString * const memberCell = @"MemberCell";
static NSString * const requestCell = @"RequestCell";


- (instancetype)initWithNetworkService:(ESKNetworkService *)networkService
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[ESKMemberCell class] forCellReuseIdentifier:memberCell];
    [self.tableView registerClass:[ESKRequestCell class] forCellReuseIdentifier:requestCell];
    
    self.membersRequestArray = [NSMutableArray new];
    self.membersRequestArray = [NSMutableArray new];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView setEstimatedRowHeight: 60.f];
    [self.networkService getTeam];
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
    {
        return [self.membersArray count];
    }
    return [self.membersRequestArray count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Members";
    }
    return @"Requests";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ESKUser *user = [ESKUser new];
    user.name = self.membersRequestArray[indexPath.row].name;
    user.email = self.membersRequestArray[indexPath.row].email;
    if (indexPath.section == 0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:memberCell forIndexPath:indexPath];
        [((ESKMemberCell *)cell) setUser:user];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:requestCell forIndexPath:indexPath];
    [((ESKRequestCell *)cell) setUser:user];
    return cell;
}


#pragma mark - ESKTeamViewDelegat

- (void)memberRequestAction:(ESKMyTeamRequest)request forUserID:(NSString *)userID
{
    //request in networkSrvice
}


#pragma mark - NetworkServiceTeamOutputProtocol

- (void)teamDidDownload:(NSDictionary *)postDictionary {
    NSArray *memberArray = postDictionary[@"members"];
    self.membersArray = [self parseUserArray:memberArray];
    NSArray *requestArray = postDictionary[@"membersRequest"];
    self.membersRequestArray = [self parseUserArray:requestArray];
    [self.tableView reloadData];
}

- (void)downloadFromCoreData {
    
}



- (NSArray<ESKUser *> *)parseUserArray:(NSArray *)array
{
    NSMutableArray<ESKUser *> *result= [NSMutableArray new];
    for (NSDictionary *userDic in array)
    {
        ESKUser *user = [ESKUser new];
        user.name = userDic[@"name"];
        user.email = userDic[@"email"];
        [result addObject:user];
    }
    return result;
}

@end
