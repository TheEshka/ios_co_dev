//
//  RegistrationView.m
//  MainProject
//
//  Created by Gagik on 09/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "RegistrationView.h"
#import "ESKTextField.h"
#import "Constants.h"
#import "ESKCloseView.h"


@interface RegistrationView ()

@property (nonatomic, strong) ESKTextField *emailField;
@property (nonatomic, strong) ESKTextField *passwordField;
@property (nonatomic, strong) UIButton *registrationButton;

@property (nonatomic, strong) UILabel *errorLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@property (nonatomic, strong) ESKCloseView *closeView;

@end

@implementation RegistrationView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}

#pragma mark - ButtonActions

- (void)registrationButtonAction
{
    if (self.emailField.text.length == 0 || self.passwordField.text.length == 0)
    {
        [self registrationUnsuccessWithMessage:@"Заполните все поля"];
        return;
    }
    
    self.registrationButton.alpha = 0;
    [self.activityView startAnimating];
    [self.delegate registrationButtonPressedWithEmail:self.emailField.text
                                          andPassword:self.passwordField.text];
}


#pragma mark - RegistrationViewActivity

- (void)registrationSuccess
{
    self.registrationButton.alpha = 1;
    [self.activityView stopAnimating];
}

- (void)registrationUnsuccessWithMessage:(NSString *)message
{
    self.registrationButton.alpha = 1;
    [self.activityView stopAnimating];
    self.errorLabel.text = message;
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
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 50.0f;
    self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
    
    self.backgroundColor = [UIColor whiteColor];
    
    _registrationButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_registrationButton setTitle:@"Register" forState:UIControlStateNormal];
    _registrationButton.layer.borderWidth = 2.f;
    _registrationButton.layer.borderColor = [UIColor darkTextColor].CGColor;
    [_registrationButton addTarget:self action:@selector(registrationButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_registrationButton];
    
    _emailField = [[ESKTextField alloc] initWithFrame:CGRectZero];
    _emailField.borderStyle = 3;
    _emailField.placeholder = @"E-mail";
    [self addSubview:_emailField];
    
    _passwordField = [[ESKTextField alloc] initWithFrame:CGRectZero];
    _passwordField.borderStyle = 3;
    _passwordField.placeholder = @"Password";
    _passwordField.secureTextEntry = YES;
    [self addSubview:_passwordField];
    
    _closeView = [[ESKCloseView alloc] init];
    _closeView.backgroundColor = [UIColor clearColor];
    [self addSubview:_closeView];
    
    _closeView.translatesAutoresizingMaskIntoConstraints = NO;
    _emailField.translatesAutoresizingMaskIntoConstraints = NO;
    _passwordField.translatesAutoresizingMaskIntoConstraints = NO;
    _registrationButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray<NSLayoutConstraint *> *constraints=
    @[
      [_closeView.topAnchor constraintEqualToAnchor:self.topAnchor constant:20],
      [_closeView.heightAnchor constraintEqualToConstant:30],
      [_closeView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_closeView.widthAnchor constraintEqualToAnchor:self.widthAnchor],
      
      [_emailField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_emailField.bottomAnchor constraintEqualToAnchor:_passwordField.topAnchor constant:-ESKBetweenOffset],
      [_emailField.widthAnchor constraintEqualToConstant:ESKTextFiledWidth],
      //[_emailField.heightAnchor constraintEqualToConstant:25.f],
      
      [_passwordField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_passwordField.bottomAnchor constraintEqualToAnchor:self.centerYAnchor constant:-ESKBetweenOffset],
      [_passwordField.widthAnchor constraintEqualToConstant:ESKTextFiledWidth],
      //[_passwordField.heightAnchor constraintEqualToConstant:25.f],
      
      [_registrationButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_registrationButton.topAnchor constraintEqualToAnchor:_passwordField.bottomAnchor constant:50.f],
      [_registrationButton.widthAnchor constraintEqualToConstant:ESKButtonWidth],
      //[_registrationButton.heightAnchor constraintEqualToConstant:25.f]
      ];
    [self addConstraints:constraints];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
    
}


- (void)setDelegate:(id<RegistrationViewDelegate>)delegate
{
    _delegate = delegate;
    _closeView.delegate = delegate;
}


@end
