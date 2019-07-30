//
//  Image+CoreDataProperties.m
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//
//

#import "Image+CoreDataProperties.h"

@implementation Image (CoreDataProperties)

+ (NSFetchRequest<Image *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Image"];
}

@dynamic imageID;
@dynamic image;
@dynamic userImage;
@dynamic postImage;

@end
