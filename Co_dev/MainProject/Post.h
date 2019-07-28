//
//  Post.h
//  MainProject
//
//  Created by Gagik on 27/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject

@property (nonatomic, strong) NSString *postTitle;
@property (nonatomic, strong) NSString *postSubject;
@property (nonatomic, strong) NSString *postDescription;
@property (nonatomic, strong) NSString *postAuthor;
@property (nonatomic, strong) NSString *postCreatedTime;

@end

NS_ASSUME_NONNULL_END
