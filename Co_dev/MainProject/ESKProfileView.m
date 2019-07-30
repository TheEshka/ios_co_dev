//
//  ESKAuthorizedProfileView.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKProfileView.h"
#import "ESKConstants.h"
#import "ESKProfilePresenter.h"
#import "ESKArcView.h"
#import "ESKUser.h"

@interface ESKProfileView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *emailLabel;
@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UITextField *cityField;
@property (nonatomic, strong) UILabel *githubLinkLabel;
@property (nonatomic, strong) UITextField *githubLinkField;
@property (nonatomic, strong) UILabel *aboutMeLabel;
@property (nonatomic, strong) UITextField *aboutMeField;

@property (nonatomic, strong) UIButton *exitButton;

@end

@implementation ESKProfileView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}


#pragma mark - Button Actions
-(void)exitButtonAction
{
    [self.delegate exitButtonPressed];
}


- (void)createUI
{
    self.backgroundColor = [UIColor grayColor];
    
    ESKArcView *footer = [[ESKArcView alloc] initWithFrame:CGRectMake(300, 0, 1000, 277)];
    [self addSubview:footer];
    
    _emailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _emailLabel.text = @"Your email:";
    _emailLabel.font = [UIFont systemFontOfSize:20];
    [footer addSubview:_emailLabel];
    
    _emailField = [[UITextField alloc] init];
    _emailField.allowsEditingTextAttributes = NO;
    _emailField.borderStyle = 3;
    _emailField.font = [UIFont systemFontOfSize:20];
    [footer addSubview:_emailField];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nameLabel.text = @"Your name:";
    _nameLabel.font = [UIFont systemFontOfSize:20];
    [footer addSubview:_nameLabel];
    
    _nameField = [[UITextField alloc] initWithFrame:CGRectZero];
    _nameField.allowsEditingTextAttributes = YES;
    _nameField.font = [UIFont systemFontOfSize:20];
    _nameField.borderStyle = 3;
    [footer addSubview:_nameField];
    
    _cityLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _cityLabel.text = @"Your city:";
    _cityLabel.font = [UIFont systemFontOfSize:20];
    [footer addSubview:_cityLabel];
    
    _cityField = [[UITextField alloc] initWithFrame:CGRectZero];
    _cityField.text = @"Москва";
    _cityField.allowsEditingTextAttributes = YES;
    _cityField.font = [UIFont systemFontOfSize:20];
    _cityField.borderStyle = 3;
    [footer addSubview:_cityField];
    
    _githubLinkLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _githubLinkLabel.text = @"Git link:";
    _githubLinkLabel.font = [UIFont systemFontOfSize:20];
    [footer addSubview:_githubLinkLabel];
    
    _githubLinkField = [[UITextField alloc] initWithFrame:CGRectZero];
    _githubLinkField.text = @"github.com/TheEshka";
    _githubLinkField.allowsEditingTextAttributes = YES;
    _githubLinkField.font = [UIFont systemFontOfSize:20];
    _githubLinkField.borderStyle = 3;
    [footer addSubview:_githubLinkField];
    
    _aboutMeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _aboutMeLabel.text = @"About me:";
    _aboutMeLabel.font = [UIFont systemFontOfSize:20];
    [footer addSubview:_aboutMeLabel];
    
    _aboutMeField = [[UITextField alloc] initWithFrame:CGRectZero];
    _aboutMeField.text = @"Procrestinacia";
    _aboutMeField.allowsEditingTextAttributes = YES;
    _aboutMeField.font = [UIFont systemFontOfSize:20];
    _aboutMeField.borderStyle = 3;
    [footer addSubview:_aboutMeField];
    
    
    self.imageView = [UIImageView new];
    self.imageView.image = [UIImage imageNamed:@"img"];
    self.imageView.layer.cornerRadius = 50.;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.imageView.layer.borderWidth = 3.;
    self.imageView.layer.borderColor = UIColor.darkGrayColor.CGColor;
    [self addSubview:self.imageView];
    
    _exitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _exitButton.backgroundColor = [UIColor colorWithRed:255/255.f green:64/255.f blue:64/255.f alpha:1];
    [_exitButton setTitle:@"Exit Account" forState:UIControlStateNormal];
    _exitButton.layer.borderWidth = 2.f;
    _exitButton.layer.borderColor = [UIColor darkTextColor].CGColor;
    [_exitButton addTarget:self action:@selector(exitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [footer addSubview:_exitButton];
    
    footer.translatesAutoresizingMaskIntoConstraints = NO;
    _emailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _emailField.translatesAutoresizingMaskIntoConstraints = NO;
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _nameField.translatesAutoresizingMaskIntoConstraints = NO;
    _cityLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _cityField.translatesAutoresizingMaskIntoConstraints = NO;
    _githubLinkLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _githubLinkField.translatesAutoresizingMaskIntoConstraints = NO;
    _aboutMeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _aboutMeField.translatesAutoresizingMaskIntoConstraints = NO;
    _exitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray<NSLayoutConstraint *> *constraints =
    @[
      [footer.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:20],
      [footer.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [footer.widthAnchor constraintEqualToAnchor:self.widthAnchor],
      [footer.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
      
      [self.imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:100.f],
      [self.imageView.widthAnchor constraintEqualToConstant:150.f],
      [self.imageView.heightAnchor constraintEqualToConstant:200.f],
      
      [_emailLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:30.f],
      [_emailLabel.topAnchor constraintEqualToAnchor:footer.topAnchor constant:60],
      
      [_emailField.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-30],
      [_emailField.topAnchor constraintEqualToAnchor:_emailLabel.topAnchor],
      [_emailField.leadingAnchor constraintLessThanOrEqualToAnchor:self.centerXAnchor constant:-20],
      
      [_nameLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:30],
      [_nameLabel.topAnchor constraintEqualToAnchor:_emailLabel.bottomAnchor constant:30],
      
      [_nameField.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-30],
      [_nameField.topAnchor constraintEqualToAnchor:_nameLabel.topAnchor],
      [_nameField.leadingAnchor constraintEqualToAnchor:_emailField.leadingAnchor],
      
      [_cityLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:30],
      [_cityLabel.topAnchor constraintEqualToAnchor:_nameLabel.bottomAnchor constant:30],
      
      [_cityField.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-30],
      [_cityField.topAnchor constraintEqualToAnchor:_cityLabel.topAnchor],
      [_cityField.leadingAnchor constraintEqualToAnchor:_emailField.leadingAnchor],
      
      [_githubLinkLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:30],
      [_githubLinkLabel.topAnchor constraintEqualToAnchor:_cityLabel.bottomAnchor constant:30],
      
      [_githubLinkField.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-30],
      [_githubLinkField.topAnchor constraintEqualToAnchor:_githubLinkLabel.topAnchor],
      [_githubLinkField.leadingAnchor constraintEqualToAnchor:_emailField.leadingAnchor],
      
      [_aboutMeLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:30],
      [_aboutMeLabel.topAnchor constraintEqualToAnchor:_githubLinkLabel.bottomAnchor constant:30],
      
      [_aboutMeField.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-30],
      [_aboutMeField.topAnchor constraintEqualToAnchor:_aboutMeLabel.topAnchor],
      [_aboutMeField.leadingAnchor constraintEqualToAnchor:_emailField.leadingAnchor],
      
      [_exitButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_exitButton.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
      ];
    
    [NSLayoutConstraint activateConstraints:constraints];
}

- (void)setUser:(ESKUser *)user
{
    self.nameField.text = user.name;
    self.emailField.text = user.email;
}


@end
