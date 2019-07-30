//
//  Post.h
//  MainProject
//
//  Created by Gagik on 27/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESKUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKPost : NSObject

@property (nonatomic, copy) NSString *postID;
@property (nonatomic, copy) NSString *postTitle;
@property (nonatomic, copy) NSString *postSubject;
@property (nonatomic, copy) NSString *postDescription;
@property (nonatomic, copy) NSString *postCreatedTime;
@property (nonatomic, copy) NSString *postImageID;
@property (nonatomic, strong) ESKUser *postAuthor;
@property (nonatomic, copy) NSArray<ESKUser *> *postMemebers;
@property (nonatomic, copy) NSArray<ESKUser *> *postMemebersRequest;

+ (ESKPost *)postFromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
