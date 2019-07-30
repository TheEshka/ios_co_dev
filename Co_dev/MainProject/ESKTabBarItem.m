//
//  ESKTabBarItem.m
//  MainProject
//
//  Created by Gagik on 23/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKTabBarItem.h"

@interface ESKTabBarItem ()

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation ESKTabBarItem

#pragma mark - LifeCycle overrided methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _nameLabel = [[UILabel alloc] init];
        [self addSubview:_nameLabel];
        _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_nameLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        [_nameLabel.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;

        [_nameLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
//        [_nameLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
    }
    return self;
}


#pragma msrk - ESKTabBarItemInput

- (void)itemAnimationFocusing
{
    CABasicAnimation *yAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    yAnimation.duration = 0.5;
    yAnimation.fromValue = @(1.);
    yAnimation.toValue = @(2.0);
    yAnimation.removedOnCompletion = NO;
    yAnimation.fillMode = kCAFillModeForwards;
    [self.nameLabel.layer addAnimation:yAnimation forKey:@"focusing"];
}

- (void)itemAnimationUnfocusing
{
    CABasicAnimation *yAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    yAnimation.duration = 0.5;
    yAnimation.fromValue = @(2.);
    yAnimation.toValue = @(1.0);
    yAnimation.removedOnCompletion = NO;
    yAnimation.fillMode = kCAFillModeForwards;
    [self.nameLabel.layer addAnimation:yAnimation forKey:@"unfocusing"];
}


#pragma mark - Getter/Setter

- (void)setName:(NSString *)name;
{
    _nameLabel.text = name;
}

- (NSString *)name
{
    return _nameLabel.text;
}

@end
