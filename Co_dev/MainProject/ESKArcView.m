//
//  ESKArcView.m
//  MainProject
//
//  Created by Gagik on 29/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKArcView.h"
#import "ESKConstants.h"
#import "UIColor+ESKProjectColor.h"

@implementation ESKArcView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path= [UIBezierPath new];
    
    CGFloat height = CGRectGetHeight(rect);
    CGFloat width = CGRectGetWidth(rect);
    CGFloat radius = 600;
    CGFloat delta = radius - sqrt(pow(radius, 2) - pow(width/2, 2));
    CGFloat alpha = acos(width/2/radius);
    
    [path moveToPoint:CGPointMake(0, delta)];
    [path addArcWithCenter:CGPointMake(width/2, radius) radius:radius startAngle:3*M_PI_2 - alpha endAngle:3*M_PI_2 + alpha clockwise:YES];
    [path addLineToPoint:CGPointMake(width, height)];
    [path addLineToPoint:CGPointMake(0, height)];
    [path closePath];
    
    [UIColor.esk_BackgroundColor setFill];
    [path fill];
}


@end
