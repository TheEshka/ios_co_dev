//
//  ESKTabBarCollectionView.m
//  MainProject
//
//  Created by Gagik on 24/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKTabBarCollectionView.h"

@interface ESKTabBarCollectionView ()

@end

@implementation ESKTabBarCollectionView


#pragma mark - Life Cycle

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[self setupLayout]];
    if (self) {
        [self setPagingEnabled:YES];
        self.backgroundColor = [UIColor cyanColor];
        [self setupGestureRecognizers];
    }
    return self;
}


#pragma mark - Gesture Actions

- (void)rightSwipeAction
{
    NSArray<NSIndexPath *> *selectedIndexPaths = [self indexPathsForSelectedItems];
    [self.gestureDelegate selectItemNumber:selectedIndexPaths[0].row + 1];
    
}

- (void)leftSwipeAction
{
    NSArray<NSIndexPath *> *selectedIndexPaths = [self indexPathsForSelectedItems];
    [self.gestureDelegate selectItemNumber:selectedIndexPaths[0].row - 1];
}


#pragma mark - Helper setup methods

- (UICollectionViewLayout *)setupLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return layout;
}

- (void)setupGestureRecognizers
{
    UISwipeGestureRecognizer *rightSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipeAction)];
    rightSwipeRecognizer.delaysTouchesBegan = YES;
    rightSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:rightSwipeRecognizer];
    
    UISwipeGestureRecognizer *leftSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipeAction)];
    leftSwipeRecognizer.delaysTouchesBegan = YES;
    leftSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:leftSwipeRecognizer];
}

@end
