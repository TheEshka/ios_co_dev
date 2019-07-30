//
//  AuthenticationView.m
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKAuthenticationView.h"
#import "ESKAuthenticationProtocols.h"
#import "ESKTextField.h"
#import "ESKUser.h"
#import "ESKConstants.h"

@interface ESKAuthenticationView ()

@property (nonatomic, strong) UIImageView *headerImage;

@property (nonatomic, strong) ESKTextField *emailField;
@property (nonatomic, strong) ESKTextField *passwordField;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registrationButton;

@property (nonatomic, strong) UILabel *errorLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@property (nonatomic, strong) UIButton *closeButton;

@end

@implementation ESKAuthenticationView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}


#pragma mark - ButtonActions

- (void)loginButtonAction
{
    ESKUser *user = [ESKUser new];
    user.email = self.emailField.text;
    user.password = self.passwordField.text;
    
    self.loginButton.alpha = 0;
    [self.activityView startAnimating];
    [self.presenter loginButtonPressedWithUserParams:user];
    
    [self endEditing:YES];
}

- (void)registrationButtonAction
{
    [self.delegate registrationButtonPressed];
}

- (void)closeButtonAction
{
    [self.delegate close];
}


#pragma mark - ESKAuthenticationPresenterDelegate

- (void)authorizationSuccess
{
    self.loginButton.alpha = 1;
    [self.activityView stopAnimating];
    [self.delegate close];
}

- (void)authorizationUnsuccessWithMessage:(NSString *)message
{
    self.errorLabel.text = message;
    self.loginButton.alpha = 1;
    [self.activityView stopAnimating];
}

#pragma marl - Getters

- (UILabel *)errorLabel
{
    if (!_errorLabel) {
        _errorLabel = [[UILabel alloc] init];
        _errorLabel.textAlignment = NSTextAlignmentCenter;
        [_errorLabel setTextColor:[UIColor redColor]];
        [self addSubview:_errorLabel];
        _errorLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [_errorLabel.topAnchor constraintEqualToAnchor:_registrationButton.bottomAnchor constant:25.f].active = YES;
        [_errorLabel.heightAnchor constraintEqualToConstant:25.f].active = YES;
        [_errorLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor].active = YES;
        [_errorLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
        
    }
    return _errorLabel;
}

- (UIActivityIndicatorView *)activityView
{
    if (!_activityView)
    {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
        _activityView.center = self.loginButton.center;
        [self addSubview:_activityView];
    }
    return _activityView;
}


#pragma mark - UIHelper

- (void)createUI
{
    self.backgroundColor = [UIColor whiteColor];
    
    _headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"people"]];
    _headerImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_headerImage];
    
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_loginButton setTitle:@"Log in" forState:UIControlStateNormal];
    _loginButton.layer.borderWidth = 2.f;
    _loginButton.layer.borderColor = [UIColor darkTextColor].CGColor;
    [_loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_loginButton];
    
    _emailField = [[ESKTextField alloc] initWithFrame:CGRectZero];
    _emailField.borderStyle = 3;
    _emailField.placeholder = @"Login";
    [self addSubview:_emailField];
    
    _passwordField = [[ESKTextField alloc] initWithFrame:CGRectZero];
    _passwordField.borderStyle = 3;
    _passwordField.placeholder = @"Password";
    _passwordField.secureTextEntry = YES;
    [self addSubview:_passwordField];
    
    _registrationButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_registrationButton setTitle:@"Registrate" forState:UIControlStateNormal];
    [_registrationButton addTarget:self action:@selector(registrationButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_registrationButton];
    
    _closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _closeButton.backgroundColor = [UIColor colorWithRed:255/255.f green:64/255.f blue:64/255.f alpha:1];
    [_closeButton setTitle:@"Back" forState:UIControlStateNormal];
    _closeButton.layer.borderWidth = 2.f;
    _closeButton.layer.borderColor = [UIColor darkTextColor].CGColor;
    [_closeButton setHidden:YES];
    [_closeButton addTarget:self action:@selector(closeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_closeButton];
    
    _headerImage.translatesAutoresizingMaskIntoConstraints = NO;
    _emailField.translatesAutoresizingMaskIntoConstraints = NO;
    _passwordField.translatesAutoresizingMaskIntoConstraints = NO;
    _loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    _registrationButton.translatesAutoresizingMaskIntoConstraints = NO;
    _closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray<NSLayoutConstraint *> *constraints=
    @[
      [_headerImage.bottomAnchor constraintEqualToAnchor:_emailField.topAnchor constant:-ESKBetweenOffset],
      [_headerImage.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
      [_headerImage.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
      
      [_emailField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_emailField.bottomAnchor constraintEqualToAnchor:_passwordField.topAnchor constant:-ESKBetweenOffset],
      [_emailField.widthAnchor constraintEqualToConstant:ESKStandartTextFiledWidth],
      [_emailField.heightAnchor constraintEqualToConstant:ESKStandartTextFiledHeight],
      
      [_passwordField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_passwordField.bottomAnchor constraintEqualToAnchor:self.centerYAnchor constant: -ESKBetweenOffset],
      [_passwordField.widthAnchor constraintEqualToConstant:ESKStandartTextFiledWidth],
      [_passwordField.heightAnchor constraintEqualToConstant:ESKStandartTextFiledHeight],
      
      [_loginButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_loginButton.topAnchor constraintEqualToAnchor:_passwordField.bottomAnchor constant:ESKStandartButtonOffset],
      [_loginButton.widthAnchor constraintEqualToConstant:ESKStandartButtonWidth],
      [_loginButton.heightAnchor constraintEqualToConstant:ESKStandartButtonHeight],
      
      [_registrationButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_registrationButton.topAnchor constraintEqualToAnchor:_loginButton.bottomAnchor constant:ESKStandartButtonOffset],
      [_registrationButton.widthAnchor constraintEqualToConstant:ESKStandartButtonWidth],
      [_registrationButton.heightAnchor constraintEqualToConstant:ESKStandartButtonHeight],
      
      [_closeButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_closeButton.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant: -ESKBetweenOffset],
      [_closeButton.widthAnchor constraintEqualToConstant:ESKStandartButtonWidth],
      [_closeButton.heightAnchor constraintEqualToConstant:ESKStandartButtonHeight]
      ];
    [self addConstraints:constraints];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

@end
