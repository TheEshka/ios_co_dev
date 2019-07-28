//
//  ESKCloseView.m
//  MainProject
//
//  Created by Gagik on 21/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKDraggingCloseView.h"

@interface ESKDraggingCloseView()

@property SEL action;
@property id target;

@end

static const CGFloat ESKCloseViewWidthMultiplier = 0.6f;
static const CGFloat ESKCloseViewHeight = 3.0f;

@implementation ESKDraggingCloseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
        lineView.backgroundColor = [UIColor blackColor];
        lineView.layer.cornerRadius = ESKCloseViewHeight/2;
        [self addSubview:lineView];
        
        lineView.translatesAutoresizingMaskIntoConstraints = NO;
        [lineView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
        [lineView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
        [lineView.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:ESKCloseViewWidthMultiplier].active = YES;
        [lineView.heightAnchor constraintEqualToConstant:ESKCloseViewHeight].active = YES;
        
        UIPanGestureRecognizer *dragGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
        [self addGestureRecognizer:dragGesture];
    }
    return self;
}

- (void)panGestureAction:(UIPanGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        [self.delegate draggingDidEnd];
        return;
    }
    CGPoint translation = [gesture translationInView:self];
    [self.delegate closeViewDragged:(CGPoint)translation];
}

@end
