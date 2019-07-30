//
//  Image+CoreDataProperties.h
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//
//

#import "Image+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Image (CoreDataProperties)

+ (NSFetchRequest<Image *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *imageID;
@property (nullable, nonatomic, copy) NSDate *image;
@property (nullable, nonatomic, retain) User *userImage;
@property (nullable, nonatomic, retain) Post *postImage;

@end

NS_ASSUME_NONNULL_END
