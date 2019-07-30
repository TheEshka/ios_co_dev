//
//  WallViewProtocol.h
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//
@class ESKPost;
@protocol ESKWallViewPresenter <NSObject>

- (NSInteger)presentedPostsCount;

- (ESKPost *)getPostForItem:(NSInteger)number;

- (void)getNextPosts;

- (void)getImadeWithID:(NSString *)imageID;

@end

@protocol ESKWallPresenterDelegate <NSObject>

- (void)triggerViewController;

- (void)setImage:(NSData *)data forItem:(NSInteger)number;

@end

