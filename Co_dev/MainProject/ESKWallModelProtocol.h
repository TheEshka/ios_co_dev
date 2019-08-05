//
//  ESKModelProtocol.h
//  MainProject
//
//  Created by Gagik on 29/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@class ESKPost;
@protocol ESKWallModelInput <NSObject>

- (ESKPost *)downloadedPostForItem:(NSInteger)number;
- (NSInteger)downloadedPostsCount;

- (void)getPostsWithOffset:(NSInteger)offset limit:(NSInteger)limit;
//- (void)tokenDidRefresh:(NSString *)apiToken;

- (void)getImageWithID:(NSString *)imageID;

@end


@protocol ESKWallModelOutput <NSObject>

//- (void)refreshTokenRequest;

- (void)postsDidSave;

- (void)showDownloadedImageWithData:(NSData *)data forItem:(NSInteger)number;

@end
