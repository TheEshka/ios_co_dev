//
//  ViewController.m
//  MainProject
//
//  Created by Gagik on 02/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ViewController.h"
#import "ESKAuthenticationViewController.h"
#import "ESKTabBar.h"
#import "ESKTabBarItem.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *modalButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    _modalButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _modalButton.frame = CGRectMake(100, 300, 150, 50);
    //[_modalButton addTarget:self action:@selector(loginView) forControlEvents:UIControlEventTouchUpInside];
    [_modalButton setTitle:@"modaaaal" forState:UIControlStateNormal];
    [_modalButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_modalButton];
}




- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
}

@end
