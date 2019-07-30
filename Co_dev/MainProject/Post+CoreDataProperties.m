//
//  Post+CoreDataProperties.m
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//
//

#import "Post+CoreDataProperties.h"

@implementation Post (CoreDataProperties)

+ (NSFetchRequest<Post *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Post"];
}

@dynamic postID;
@dynamic postTitle;
@dynamic postSubject;
@dynamic postDescription;
@dynamic postAuthor;
@dynamic postImageID;
@dynamic createdAt;
@dynamic membersRequest;
@dynamic members;
@dynamic author;
@dynamic memberRequest;
@dynamic member;
@dynamic image;

@end
