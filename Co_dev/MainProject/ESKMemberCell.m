//
//  ESKMemberCell.m
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKMemberCell.h"
#import "ESKUser.h"

@interface ESKMemberCell ()

@property (nonatomic, strong) UIImageView *memberImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *emailLabel;

@end

@implementation ESKMemberCell

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
    _memberImage = [[UIImageView alloc] init];
    _memberImage.contentMode = UIViewContentModeScaleAspectFill;
    _memberImage.clipsToBounds = YES;
    _memberImage.layer.borderWidth = 3.;
    _memberImage.layer.borderColor = UIColor.darkGrayColor.CGColor;
    [self addSubview:_memberImage];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nameLabel.font = [UIFont systemFontOfSize:20];
    _nameLabel.numberOfLines = 1;
    [self addSubview:_nameLabel];
    
    _emailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _emailLabel.font = [UIFont systemFontOfSize:20];
    _emailLabel.numberOfLines = 1;
    [self addSubview:_emailLabel];
    
    _memberImage.translatesAutoresizingMaskIntoConstraints = NO;
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _emailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray<NSLayoutConstraint *> *constraints =
        @[
          [_memberImage.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
          [_memberImage.topAnchor constraintEqualToAnchor:self.topAnchor constant:10],
          [_memberImage.heightAnchor constraintEqualToConstant:80],
          [_memberImage.widthAnchor constraintEqualToConstant:80],
          [_memberImage.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-10],
        
          [_nameLabel.topAnchor constraintEqualToAnchor:_memberImage.topAnchor],
          [_nameLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
          [_nameLabel.leadingAnchor constraintEqualToAnchor:_memberImage.trailingAnchor constant:10],
           
          [_emailLabel.bottomAnchor constraintEqualToAnchor:_memberImage.bottomAnchor],
          [_emailLabel.trailingAnchor constraintEqualToAnchor:_nameLabel.trailingAnchor],
          [_emailLabel.leadingAnchor constraintEqualToAnchor:_nameLabel.leadingAnchor]
    ];
    [NSLayoutConstraint activateConstraints:constraints];
}

-(void)setUser:(ESKUser *)user
{
    self.nameLabel.text = user.name;
    self.emailLabel.text = user.email;
}


@end
