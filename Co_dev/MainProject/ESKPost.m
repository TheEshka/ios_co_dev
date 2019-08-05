//
//  Post.m
//  MainProject
//
//  Created by Gagik on 27/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKPost.h"
#import "ESKUser.h"

@implementation ESKPost

+ (ESKPost *)postFromDictionary:(NSDictionary *)dictionary
{
    ESKPost *post = [ESKPost new];
    post.postID = dictionary[@"id"];
    post.postTitle = dictionary[@"title"];
    post.postSubject = dictionary[@"subject"];
    post.postDescription = dictionary[@"description"];
    post.postCreatedTime = dictionary[@"createdAt"];
    
    ESKImage *image = [ESKImage new];
    image.imageID = dictionary[@"image"];
    post.postImage = image;
    
    ESKUser *author = [ESKUser new];
    author.name = dictionary[@"author"][@"name"];
    author.email = dictionary[@"author"][@"mail"];
    post.postAuthor = author;
    return post;
}

@end
