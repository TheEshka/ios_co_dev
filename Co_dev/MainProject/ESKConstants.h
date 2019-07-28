//
//  Constants.h
//  MainProject
//
//  Created by Gagik on 20/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

static const CGFloat ESKTextFiledWidth = 200.0;
static const CGFloat ESKButtonWidth = 200.0;

static const CGFloat ESKTextFiledHeight = 200.0;////
static const CGFloat ESKButtonHeight = 200.0;////

static const CGFloat ESKBetweenOffset = 20.0;



@interface UIColor (projectColor)

+ (UIColor *)ESKBackgroundColor;

@end

@implementation UIColor (projectColor)

+ (UIColor *)ESKBackgroundColor{
    return [UIColor colorWithWhite:0.95 alpha:1];
}


@end

