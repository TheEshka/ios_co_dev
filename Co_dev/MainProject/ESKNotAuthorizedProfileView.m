//
//  ESKProfileView.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKNotAuthorizedProfileView.h"
#import "ESKConstants.h"

@interface ESKNotAuthorizedProfileView ()

@property (nonatomic, strong) UILabel *notAuthorizedMessage;
@property (nonatomic, strong) UIButton *authorizeButton;

@end

@implementation ESKNotAuthorizedProfileView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.backgroundColor = [UIColor ESKBackgroundColor];
    
    _notAuthorizedMessage = [[UILabel alloc] init];
    _notAuthorizedMessage.text = @"Профиль недоступен, так как вы еще не авторизировались";
    _notAuthorizedMessage.textAlignment = NSTextAlignmentCenter;
    _notAuthorizedMessage.numberOfLines = 0;
    [self addSubview:_notAuthorizedMessage];
    
    _authorizeButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [_authorizeButton setTitle:@"Авторизироваться" forState:UIControlStateNormal];
    [_authorizeButton addTarget:self action:@selector(authorizationButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_authorizeButton];
    
    
    _notAuthorizedMessage.translatesAutoresizingMaskIntoConstraints = NO;
    _authorizeButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray<NSLayoutConstraint *> *constraints=
    @[
      [_notAuthorizedMessage.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_notAuthorizedMessage.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
      [_notAuthorizedMessage.widthAnchor constraintEqualToAnchor:self.widthAnchor],
      
      [_authorizeButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_authorizeButton.topAnchor constraintEqualToAnchor:_notAuthorizedMessage.bottomAnchor constant: 20.0f],
      ];
    [self addConstraints:constraints];
}

- (void)authorizationButtonClicked
{
//    [self.delegate authorizationButtonPressed];
}

@end
