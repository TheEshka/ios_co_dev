//
//  User+CoreDataProperties.m
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"User"];
}

@dynamic userID;
@dynamic email;
@dynamic name;
@dynamic aboutMe;
@dynamic age;
@dynamic city;
@dynamic githubLink;
@dynamic imageID;
@dynamic postAuthor;
@dynamic postMembers;
@dynamic postRequests;
@dynamic image;

@end
