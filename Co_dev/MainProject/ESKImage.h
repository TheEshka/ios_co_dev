//
//  ESKImage.h
//  MainProject
//
//  Created by Gagik on 31/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;
NS_ASSUME_NONNULL_BEGIN

@interface ESKImage : NSObject

@property (nonatomic, copy) NSString *imageID;
@property (nonatomic, strong) UIImage *image;

@end

NS_ASSUME_NONNULL_END
