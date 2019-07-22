//
//  ESKCloseView.m
//  MainProject
//
//  Created by Gagik on 21/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKCloseView.h"

@interface ESKCloseView()

@property SEL action;
@property id target;

@end

static const CGFloat ESKCloseViewLength = 100.0f;
static const CGFloat ESKCloseViewWidth = 6.0f;

@implementation ESKCloseView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
    
    CGContextSetLineWidth(context, 50);
    CGContextMoveToPoint(context, self.center.x - ESKCloseViewLength/2, self.center.y - ESKCloseViewWidth/2);
    CGContextAddLineToPoint(context, self.center.x + ESKCloseViewLength/2, self.center.y - ESKCloseViewWidth/2);
    CGContextStrokePath(context);
}

//- (void)addTarget:(nullable id)target forAction:(SEL)action
//{
//    self.action = action;
//    self.target = target;
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.delegate close];
}

@end
