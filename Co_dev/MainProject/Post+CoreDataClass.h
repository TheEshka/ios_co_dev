//
//  Post+CoreDataClass.h
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Image, NSObject, User;

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Post+CoreDataProperties.h"
