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

@interface ESKProfileView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *emailLabel;
@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UITextField *nameField;

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
    
//    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(300, 0, 1000, 277)];
//    footer.clipsToBounds = YES;
//    footer.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
//    footer.layer.cornerRadius = 500;
//    footer.backgroundColor = [UIColor ESKBackgroundColor];
//    [self addSubview:footer];
    ESKArcView *footer = [[ESKArcView alloc] initWithFrame:CGRectMake(300, 0, 1000, 277)];
    [self addSubview:footer];
    
    _emailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _emailLabel.text = @"Your email:";
    [footer addSubview:_emailLabel];
    
    _emailField = [[UITextField alloc] init];
    _emailField.allowsEditingTextAttributes = NO;
    _emailField.text = @"ya.the.eska@gamil.com";
    _emailField.borderStyle = 2;
    [footer addSubview:_emailField];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nameLabel.text = @"Your name:";
    [footer addSubview:_nameLabel];
    
    _nameField = [[UITextField alloc] initWithFrame:CGRectZero];
    _emailField.allowsEditingTextAttributes = YES;
    _nameField.text = @"TheEshka";
    _nameField.borderStyle = 3;
    [footer addSubview:_nameField];
    
    
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
      [self.imageView.widthAnchor constraintEqualToConstant:150.],
      [self.imageView.heightAnchor constraintEqualToConstant:150],
      
      [_emailLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
      [_emailLabel.topAnchor constraintEqualToAnchor:footer.topAnchor constant:60],
      
      [_emailField.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
      [_emailField.topAnchor constraintEqualToAnchor:_emailLabel.topAnchor],
      
      [_nameLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
      [_nameLabel.topAnchor constraintEqualToAnchor:_emailLabel.bottomAnchor constant:10],
      
      [_nameField.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
      [_nameField.topAnchor constraintEqualToAnchor:_nameLabel.topAnchor],
      
      [_exitButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_exitButton.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
      ];
    
    [NSLayoutConstraint activateConstraints:constraints];
}


@end
