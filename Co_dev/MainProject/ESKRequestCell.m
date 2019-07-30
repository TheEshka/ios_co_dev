//
//  ESKRequestCell.m
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKRequestCell.h"
#import "ESKUser.h"
#import "ESKConstants.h"

@interface ESKRequestCell ()

@property (nonatomic, strong) UIImageView *requestImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *emailLabel;

@property (nonatomic, strong) UIButton *crossButton;
@property (nonatomic, strong) UIButton *tickButton;

@end

@implementation ESKRequestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}


- (void)createUI
{
    _requestImage = [[UIImageView alloc] init];
    _requestImage.contentMode = UIViewContentModeScaleAspectFill;
    _requestImage.clipsToBounds = YES;
    _requestImage.layer.borderWidth = 3.;
    _requestImage.layer.borderColor = UIColor.darkGrayColor.CGColor;
    [self addSubview:_requestImage];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nameLabel.font = [UIFont systemFontOfSize:20];
    _nameLabel.numberOfLines = 1;
    [self addSubview:_nameLabel];
    
    _emailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _emailLabel.font = [UIFont systemFontOfSize:20];
    _emailLabel.numberOfLines = 1;
    [self addSubview:_emailLabel];
    
    _crossButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_crossButton addTarget:self action:@selector(deniedMemberRequest) forControlEvents: UIControlEventTouchUpInside];
    [_crossButton setBackgroundImage:[UIImage imageNamed:@"cross"] forState:UIControlStateNormal];
    _crossButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_crossButton];
    
    _tickButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_tickButton addTarget:self action:@selector(accessMemberRequest) forControlEvents: UIControlEventTouchUpInside];
    [_tickButton setBackgroundImage:[UIImage imageNamed:@"tick"] forState:UIControlStateNormal];
    _tickButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_tickButton];
    
    _requestImage.translatesAutoresizingMaskIntoConstraints = NO;
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _emailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _crossButton.translatesAutoresizingMaskIntoConstraints = NO;
    _tickButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray<NSLayoutConstraint *> *constraints =
    @[
      [_requestImage.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
      [_requestImage.topAnchor constraintEqualToAnchor:self.topAnchor constant:10],
      [_requestImage.heightAnchor constraintEqualToConstant:80],
      [_requestImage.widthAnchor constraintEqualToConstant:80],
      [_requestImage.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-10],
      
      [_nameLabel.topAnchor constraintEqualToAnchor:_requestImage.topAnchor],
      [_nameLabel.trailingAnchor constraintEqualToAnchor:_emailLabel.trailingAnchor],
      [_nameLabel.leadingAnchor constraintEqualToAnchor:_requestImage.trailingAnchor constant:10],
      
      [_emailLabel.bottomAnchor constraintEqualToAnchor:_requestImage.bottomAnchor],
      [_emailLabel.trailingAnchor constraintEqualToAnchor:_tickButton.leadingAnchor ],
      [_emailLabel.leadingAnchor constraintEqualToAnchor:_nameLabel.leadingAnchor],
      
      [_tickButton.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
      [_tickButton.topAnchor constraintEqualToAnchor:self.topAnchor constant:10],
      [_tickButton.heightAnchor constraintEqualToConstant:25],
      [_tickButton.widthAnchor constraintEqualToConstant:25],
      
      [_crossButton.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
      [_crossButton.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-10],
      [_crossButton.heightAnchor constraintEqualToConstant:25],
      [_crossButton.widthAnchor constraintEqualToConstant:25],
      ];
    [NSLayoutConstraint activateConstraints:constraints];
}

-(void)setUser:(ESKUser *)user
{
    _user = user;
    self.nameLabel.text = user.name;
    self.emailLabel.text = user.email;
}

- (void)deniedMemberRequest
{
    [self.delegate memberRequestAction:ESKDeniedRequest forUserID:self.user.userID];
}

- (void)accessMemberRequest
{
    [self.delegate memberRequestAction:ESKAccessRequest forUserID:self.user.userID];
}

@end
