//
//  ESKWallCollectionView.m
//  MainProject
//
//  Created by Gagik on 27/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKWallCollectionView.h"
#import "ESKConstants.h"
#import "UIColor+ESKProjectColor.h"

@implementation ESKWallCollectionView

#pragma mark - Life Cycle

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[self setupLayout]];
    if (self) {
        self.backgroundColor = [UIColor esk_BackgroundColor];
        self.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
        self.scrollIndicatorInsets = UIEdgeInsetsMake(15, 0, 0, 0);
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
        self.alwaysBounceVertical = YES;
    }
    return self;
}


#pragma mark - Helper setup methods

- (UICollectionViewLayout *)setupLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
    layout.minimumLineSpacing = 20;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 30, 0);
    return layout;
}

@end
