//
//  ESKProfileViewController.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKProfileViewController.h"
#import "ESKProfileView.h"
#import "ESKProfileProtocols.h"
#import "ESKAuthenticationViewController.h"

@interface ESKProfileViewController ()<ESKProfileViewDelegate>

@property (nonatomic, strong) ESKProfileView *profileView;

@end

@implementation ESKProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.profileView = [[ESKProfileView alloc] init];
    self.profileView.delegate = self;
    
    self.view = self.profileView;
}

- (void)openAuthorizationPage
{
    ESKAuthenticationViewController *authenticationViewController = [[ESKAuthenticationViewController alloc] init];
    [self presentViewController:authenticationViewController animated:YES completion:nil];
}

@end
