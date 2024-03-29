//
//  ESKContainerCollectionViewCell.m
//  MainProject
//
//  Created by Gagik on 23/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKContainerCollectionViewCell.h"

@interface ESKContainerCollectionViewCell ()

@end

@implementation ESKContainerCollectionViewCell

#pragma mark - Overrided methods for changing content of cell

- (void)prepareForReuse
{
    [super prepareForReuse];
    [self.hostView removeFromSuperview];
    self.hostView = nil;
}

- (void)setHostView:(nullable UIView *)hostView
{
    _hostView = hostView;
    //self = _hostView;
    _hostView.frame = self.contentView.bounds;
    [self.contentView addSubview:_hostView];
}


#pragma mark - Customer Methods

- (void)addViewControllerToParentViewController:(UIViewController *)parentViewController {
    [parentViewController addChildViewController:self.contentViewController];
    [self.contentViewController didMoveToParentViewController:parentViewController];
    self.hostView = self.contentViewController.view;
}

- (void)removeViewControllerFromParentViewController {
    [self.contentViewController.view removeFromSuperview];
    [self.contentViewController willMoveToParentViewController:nil];
    [self.contentViewController removeFromParentViewController];
}

@end
