//
//  ESKNetworkServiceProtocol.h
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol NetworkServiceOutputProtocol <NSObject>

- (void)loadingPhotoContinuesWithProgress:(double)progress;
- (void)loadingPhotoIsDoneWithData:(NSData *)data  forIndexPathNumber:(NSInteger)num;

- (void)searchingIsDoneWithResult:(NSDictionary *)searchResult;

@end

@protocol NetworkServiceIntputProtocol <NSObject>
@optional

- (void)configureUrlSessionWithParams:(NSDictionary *)params;

- (void)getPostWithOffset:(NSInteger)offset limit:(NSInteger)limit;

//- (void)downloadPhotoWithParams:(PhotoDetails *)params forIndexPathNumber:(NSInteger)num;

@end
