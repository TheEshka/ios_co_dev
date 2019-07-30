//
//  User+CoreDataProperties.h
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//
//

#import "User+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *userID;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *aboutMe;
@property (nullable, nonatomic, copy) NSString *age;
@property (nullable, nonatomic, copy) NSString *city;
@property (nullable, nonatomic, copy) NSString *githubLink;
@property (nullable, nonatomic, copy) NSString *imageID;
@property (nullable, nonatomic, retain) Post *postAuthor;
@property (nullable, nonatomic, retain) Post *postMembers;
@property (nullable, nonatomic, retain) Post *postRequests;
@property (nullable, nonatomic, retain) Image *image;

@end

NS_ASSUME_NONNULL_END
