//
//  ESKNetworkServiceProtocol.h
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol NetworkServiceWallOutputProtocol <NSObject>

- (void)downloadFromCoreData;

- (void)postsDidDowload:(NSDictionary *)postsDictionary;

- (void)loadingPhotoIsDoneWithData:(NSData *)data forPhotoID:(NSString *)photoID;

- (void)getWrongTokenResponseWithCompilition:(void (^)(void))complition;


@end


@protocol NetworkServiceTeamOutputProtocol <NSObject>

- (void)teamDidDownload:(NSDictionary *)postDictionary;

@end

@class ESKPost;
@protocol NetworkServiceIntputProtocol <NSObject>

- (void)downloadPostsWithOffset:(NSInteger)offset limit:(NSInteger)limit;

- (void)downloadImageWithID:(NSString *)photoID;

- (void)getTeam;

@end
