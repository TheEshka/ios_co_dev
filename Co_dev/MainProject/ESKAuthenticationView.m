//
//  AuthenticationView.m
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKAuthenticationView.h"
#import "ESKAuthenticationProtocol.h"
#import "ESKTextField.h"

@interface ESKAuthenticationView ()

@property (nonatomic, strong) ESKTextField *emailField;
@property (nonatomic, strong) ESKTextField *passwordField;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registrationButton;

@property (nonatomic, strong) UILabel *errorLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;

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
    if (self.emailField.text.length == 0 || self.passwordField.text.length == 0)
    {
        [self authorizationUnsuccessWithMessage:@"Заполните все поля"];
        return;
    }
    
    self.loginButton.alpha = 0;
    [self.activityView startAnimating];
    [self.delegate loginButtonPressedWithEmail:self.emailField.text andPassword:self.passwordField.text];
}

- (void)registrationButtonAction
{
    [self.delegate goToRegistrationButtonPressed];
}


#pragma mark - AithorizationViewActivity

- (void)authorizationSuccess
{
    self.loginButton.alpha = 1;
    [self.activityView stopAnimating];
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
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
        _activityView.center = self.registrationButton.center;
        [self addSubview:_activityView];
    }
    return _activityView;
}


#pragma mark - UIHelper

- (void)createUI
{
    self.backgroundColor = [UIColor whiteColor];
    
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
    
    _emailField.translatesAutoresizingMaskIntoConstraints = NO;
    _passwordField.translatesAutoresizingMaskIntoConstraints = NO;
    _loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    _registrationButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray<NSLayoutConstraint *> *constraints=
    @[
      [_emailField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_emailField.bottomAnchor constraintEqualToAnchor:self.centerYAnchor constant:-20.f],
      [_emailField.widthAnchor constraintEqualToConstant:200.f],
      [_emailField.heightAnchor constraintEqualToConstant:25.f],
      
      [_passwordField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_passwordField.topAnchor constraintEqualToAnchor:self.centerYAnchor constant:20.f],
      [_passwordField.widthAnchor constraintEqualToConstant:200.f],
      [_passwordField.heightAnchor constraintEqualToConstant:25.f],
      
      [_loginButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_loginButton.topAnchor constraintEqualToAnchor:_passwordField.bottomAnchor constant:50.f],
      [_loginButton.widthAnchor constraintEqualToConstant:150.f],
      [_loginButton.heightAnchor constraintEqualToConstant:25.f],
      
      [_registrationButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_registrationButton.topAnchor constraintEqualToAnchor:_loginButton.bottomAnchor constant:50.f],
      [_registrationButton.widthAnchor constraintEqualToConstant:100.f],
      [_registrationButton.heightAnchor constraintEqualToConstant:25.f]
      ];
    [self addConstraints:constraints];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
    
}

@end
