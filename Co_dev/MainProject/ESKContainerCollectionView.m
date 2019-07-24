//
//  ESKContainerCollectionView.m
//  MainProject
//
//  Created by Gagik on 24/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKContainerCollectionView.h"

@implementation ESKContainerCollectionView

#pragma mark - Life Cycle

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[self setupLayout]];
    if (self) {
        [self setPagingEnabled:YES];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        self.backgroundColor = [UIColor cyanColor];
    }
    return self;
}


#pragma mark - Helper setup methods

- (UICollectionViewLayout *)setupLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return layout;
}

@end
