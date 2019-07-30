//
//  Post+CoreDataProperties.h
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//
//

#import "Post+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Post (CoreDataProperties)

+ (NSFetchRequest<Post *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *postID;
@property (nullable, nonatomic, copy) NSString *postTitle;
@property (nullable, nonatomic, copy) NSString *postSubject;
@property (nullable, nonatomic, copy) NSString *postDescription;
@property (nullable, nonatomic, retain) NSObject *postAuthor;
@property (nullable, nonatomic, copy) NSString *postImageID;
@property (nullable, nonatomic, copy) NSString *createdAt;
@property (nullable, nonatomic, retain) NSObject *membersRequest;
@property (nullable, nonatomic, retain) NSObject *members;
@property (nullable, nonatomic, retain) User *author;
@property (nullable, nonatomic, retain) NSSet<User *> *memberRequest;
@property (nullable, nonatomic, retain) NSSet<User *> *member;
@property (nullable, nonatomic, retain) Image *image;

@end

@interface Post (CoreDataGeneratedAccessors)

- (void)addMemberRequestObject:(User *)value;
- (void)removeMemberRequestObject:(User *)value;
- (void)addMemberRequest:(NSSet<User *> *)values;
- (void)removeMemberRequest:(NSSet<User *> *)values;

- (void)addMemberObject:(User *)value;
- (void)removeMemberObject:(User *)value;
- (void)addMember:(NSSet<User *> *)values;
- (void)removeMember:(NSSet<User *> *)values;

@end

NS_ASSUME_NONNULL_END
