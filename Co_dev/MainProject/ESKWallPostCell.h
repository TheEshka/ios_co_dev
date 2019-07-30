//
//  ESKWallPostCell.h
//  MainProject
//
//  Created by Gagik on 27/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKWallPostCell : UICollectionViewCell

@property (nonatomic, strong) ESKPost *post;

- (void)setImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
