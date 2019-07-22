//
//  ViewController.m
//  MainProject
//
//  Created by Gagik on 02/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ViewController.h"
#import "AuthenticationViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *modalButton;

@property (nonatomic, strong) UIViewController *loginViewController;
@property (nonatomic, strong) UIViewController *registrationViewController;

@property (nonatomic, strong) UITextField *trans;
@property (nonatomic, strong) UITextField *present;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(self.view.frame), CGRectGetWidth(self.view.frame), 250.0f)];
    NSMutableArray<UILabel *> *tabsArray = [NSMutableArray new];
    

}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
//    _loginViewController = [AuthenticationViewController new];
//    [self presentViewController:_loginViewController animated:YES completion:nil];
    
    
//    _modalButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    _modalButton.frame = CGRectMake(100, 300, 150, 50);
//    [_modalButton addTarget:self action:@selector(loginView) forControlEvents:UIControlEventTouchUpInside];
//    [_modalButton setTitle:@"modaaaal" forState:UIControlStateNormal];
//    [self.view addSubview:_modalButton];
//
//    _trans = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, 150, 40)];
//    _trans.placeholder = @"TransitionStyle";
//    [self.view addSubview:_trans];
//    _present = [[UITextField alloc] initWithFrame:CGRectMake(100, 110, 150, 40)];
//    _present.placeholder = @"PresentationStyle";
//    [self.view addSubview:_present];
}

@end
