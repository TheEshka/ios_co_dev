//
//  ESKWallModel.m
//  MainProject
//
//  Created by Gagik on 29/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKWallModel.h"
#import "ESKNetworkService.h"
#import "ESKNetworkServiceProtocol.h"
#import "AppDelegate.h"
#import "ESKPost.h"
#import "Post+CoreDataClass.h"

@interface ESKWallModel ()<NetworkServiceWallOutputProtocol>

@property (nonatomic, strong) ESKNetworkService *networkService;
@property (nonatomic, strong) NSMutableArray<ESKPost *> *posts;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSData *> *allPhotos;

@property (nonatomic, copy, nullable) void (^complition)(void);

@property (nonatomic, assign) BOOL isExistInternetConnection;

@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;

@end

@implementation ESKWallModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _networkService = [ESKNetworkService sharedInstance];
        _networkService.wallOutput = self;
        _posts = [NSMutableArray new];
        _allPhotos = [NSMutableDictionary new];
        _isExistInternetConnection = YES;
    }
    return self;
}

- (ESKPost *)downloadedPostForItem:(NSInteger)number
{
    return self.posts[number];
}

- (NSInteger)downloadedPostsCount
{
    return [self.posts count];
}


#pragma mark - ESKWallModelInput

- (void)getPostsWithOffset:(NSInteger)offset limit:(NSInteger)limit
{
    if (self.isExistInternetConnection){
        [self.networkService downloadPostsWithOffset:offset limit:limit];
    }
}

- (void)tokenDidRefresh:(NSString *)apiTopken
{
    self.networkService.apiToken = apiTopken;
    self.complition();
}

- (void)getImageWithID:(NSString *)imageID
{
    NSData *image = self.allPhotos[imageID];
    if (image)
    {
        [self loadingPhotoIsDoneWithData:image forPhotoID:imageID];
        return;
    }
    [self.networkService downloadImageWithID:imageID];
}


#pragma mark - NetworkServiceWallOutputProtocol

- (void)downloadFromCoreData
{
    self.isExistInternetConnection = NO;
}

- (void)postsDidDowload:(NSDictionary *)postsArray
{
    ESKPost *post;
    for (NSDictionary *onePost in postsArray)
    {
        post = [ESKPost postFromDictionary:onePost];
        [self.posts addObject:post];
    }
    if ([postsArray count] == 0)
    {
        return;
    }
    [self.changeDelegate postsDidSave];
}

- (void)getWrongTokenResponseWithCompilition:(void (^)(void))complition;
{
    self.complition = complition;
    [self.changeDelegate refreshTokenRequest];
}

- (void)loadingPhotoIsDoneWithData:(NSData *)data forPhotoID:(NSString *)photoID
{
    self.allPhotos[photoID] = data;
    for (NSInteger i = 0; i < [self.posts count]; i++)
    {
        if ([self.posts[i].postImageID isEqualToString:photoID])
        {
            [self.changeDelegate showDownloadedImageWithData:data forItem:i];
            return;
        }
    }
}



//-(void)loadPosts
//{
//    NSManagedObject *object = [self.coreDataContext existingObjectWithID:@"Post" error:nil];
//    [self.coreDataContext executeFetchRequest:[Post fetchRequest] error:nil];
//    NSLog(@"%@", object);
//}
//
//-(void)savePost:(ESKPost *)postObject
//{
//    Post *post = [NSEntityDescription insertNewObjectForEntityForName:@"Post" inManagedObjectContext:self.coreDataContext];
//    post.postID = postObject.postID;
//    post.postTitle = postObject.postTitle;
//    post.postSubject = postObject.postSubject;
//    post.postDescription = postObject.postDescription;
//    post.postImageID = postObject.postImageID;
//    post.createdAt = postObject.postCreatedTime;
//    post.members = postObject.postMemebers;
//    post.membersRequest = postObject.postMemebersRequest;
//    post.postAuthor = postObject.postAuthor;
//
//    [self.coreDataContext save:nil];
//}



@end
