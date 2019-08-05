//
//  RegistrationView.m
//  MainProject
//
//  Created by Gagik on 09/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKRegistrationView.h"
#import "ESKTextField.h"
#import "ESKConstants.h"
#import "ESKDraggingCloseView.h"
#import "ESKUser.h"


@interface ESKRegistrationView ()

@property (nonatomic, strong) ESKTextField *emailField;
@property (nonatomic, strong) ESKTextField *nameField;
@property (nonatomic, strong) ESKTextField *passwordField;
@property (nonatomic, strong) UIButton *registrationButton;

@property (nonatomic, strong) UILabel *errorLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@property (nonatomic, strong) ESKDraggingCloseView *closeView;

@end

@implementation ESKRegistrationView

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
    [self endEditing:YES];
    
    self.registrationButton.alpha = 0;
    [self.activityView startAnimating];
    
    ESKUser *user = [ESKUser new];
    user.name = self.nameField.text;
    user.email = self.emailField.text;
    user.password = self.passwordField.text;
    [self.presenter registrationButtonPressedWithUserParams:user];
}

- (void)endEditingEmail
{
    [self.nameField becomeFirstResponder];
}

- (void)endEditingName
{
    [self.passwordField becomeFirstResponder];
}


#pragma mark - ESKRegistrationPresenterDelegate

- (void)registrationSuccess
{
    self.registrationButton.alpha = 1;
    [self.activityView stopAnimating];
    
    [self.delegate closeAllModals];
}

- (void)registrationUnsuccessWithMessage:(NSString *)message
{
    self.registrationButton.alpha = 1;
    [self.activityView stopAnimating];
    self.errorLabel.text = message;
}


#pragma marl - Lazy Getters

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
    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:204/255.f alpha:1];
    self.layer.cornerRadius = 100;
    self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
    
    _registrationButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_registrationButton setTitle:@"Register" forState:UIControlStateNormal];
    _registrationButton.layer.borderWidth = 2.f;
    _registrationButton.layer.borderColor = [UIColor darkTextColor].CGColor;
    [_registrationButton addTarget:self action:@selector(registrationButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_registrationButton];
    
    _emailField = [[ESKTextField alloc] initWithFrame:CGRectZero];
    _emailField.returnKeyType = UIReturnKeyNext;
    [_emailField addTarget:self action:@selector(endEditingEmail) forControlEvents:UIControlEventEditingDidEndOnExit];
    _emailField.borderStyle = 3;
    _emailField.placeholder = @"E-mail";
    [self addSubview:_emailField];
    
    _nameField = [[ESKTextField alloc] initWithFrame:CGRectZero];
    _nameField.returnKeyType = UIReturnKeyNext;
    [_nameField addTarget:self action:@selector(endEditingName) forControlEvents:UIControlEventEditingDidEndOnExit];
    _nameField.borderStyle = 3;
    _nameField.placeholder = @"Nickname";
    [self addSubview:_nameField];
    
    _passwordField = [[ESKTextField alloc] initWithFrame:CGRectZero];
    _passwordField.returnKeyType = UIReturnKeyJoin;
    [_passwordField addTarget:self action:@selector(registrationButtonAction) forControlEvents:UIControlEventEditingDidEndOnExit];
    _passwordField.borderStyle = 3;
    _passwordField.placeholder = @"Password";
    _passwordField.secureTextEntry = YES;
    [self addSubview:_passwordField];
    
    _closeView = [[ESKDraggingCloseView alloc] init];
    [self addSubview:_closeView];
    
    _closeView.translatesAutoresizingMaskIntoConstraints = NO;
    _emailField.translatesAutoresizingMaskIntoConstraints = NO;
    _nameField.translatesAutoresizingMaskIntoConstraints = NO;
    _passwordField.translatesAutoresizingMaskIntoConstraints = NO;
    _registrationButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat statusBarHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    NSArray<NSLayoutConstraint *> *constraints=
    @[
      [_closeView.topAnchor constraintEqualToAnchor:self.topAnchor constant:statusBarHeight + ESKTopOffset],
      [_closeView.heightAnchor constraintEqualToConstant:ESKCloseViewHeight],
      [_closeView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_closeView.widthAnchor constraintEqualToAnchor:self.widthAnchor],
      
      [_emailField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_emailField.bottomAnchor constraintEqualToAnchor:_nameField.topAnchor constant:-ESKBetweenOffset],
      [_emailField.widthAnchor constraintEqualToConstant:ESKStandartTextFiledWidth],
      [_emailField.heightAnchor constraintEqualToConstant:ESKStandartTextFiledHeight],
      
      [_nameField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_nameField.bottomAnchor constraintEqualToAnchor:_passwordField.topAnchor constant:-ESKBetweenOffset],
      [_nameField.widthAnchor constraintEqualToConstant:ESKStandartTextFiledWidth],
      [_nameField.heightAnchor constraintEqualToConstant:ESKStandartTextFiledHeight],
      
      [_passwordField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_passwordField.bottomAnchor constraintEqualToAnchor:self.centerYAnchor constant:-ESKBetweenOffset],
      [_passwordField.widthAnchor constraintEqualToConstant:ESKStandartTextFiledWidth],
      [_passwordField.heightAnchor constraintEqualToConstant:ESKStandartTextFiledHeight],
      
      [_registrationButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_registrationButton.topAnchor constraintEqualToAnchor:_passwordField.bottomAnchor constant:ESKStandartButtonHeight],
      [_registrationButton.widthAnchor constraintEqualToConstant:ESKStandartButtonWidth],
      ];
    [self addConstraints:constraints];
}


#pragma mark - Overrided Getter/Setter

- (void)setCloseDelegate:(id<ESKCloseDraggableViewDelegate>)closeDelegate
{
    _closeView.delegate = closeDelegate;
}

- (id<ESKCloseDraggableViewDelegate>)closeDelegate
{
    return _closeView.delegate;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

@end
