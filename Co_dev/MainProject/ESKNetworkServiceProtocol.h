//
//  ESKNetworkServiceProtocol.h
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//


@protocol ESKNetworkServiceWallOutputProtocol <NSObject>

- (void)downloadFromCoreData;

- (void)postsDidDowload:(NSDictionary *)postsDictionary;

- (void)loadingPhotoIsDoneWithData:(NSData *)data forPhotoID:(NSString *)photoID;

@end


@protocol ESKNetworkServiceTeamOutputProtocol <NSObject>

- (void)teamDidDownload:(NSDictionary *)postDictionary;

- (void)downloadFromCoreData;

@end


@protocol ESKNetworkServiceProfileOutputProtocol <NSObject>

- (void)downloadFromCoreData;

- (void)profileDidDownload:(NSDictionary *)userDictionary;


@end


@class ESKPost;
@class ESKUser;
@protocol ESKNetworkServiceIntputProtocol <NSObject>

- (void)downloadPostsWithOffset:(NSInteger)offset limit:(NSInteger)limit;

- (void)downloadImageWithID:(NSString *)photoID;

- (void)getTeam;

- (void)downloadInfoOfUser:(NSString *)userID;

- (void)changeProfileInfoWithParams:(ESKUser *)user;

@end


@protocol ESKNetworkTokenSetter <NSObject>

- (void)setToken:(NSString *)apiToken;

@end


@protocol ESKNetworkAuthenticate <NSObject>
/**
 Send authorization request that will callback response to authorizationDelegate by AuthorizationServiceAuthorizationDelegate
 
 @param user Object ESKUser with email and password
 */
- (void)authorizeWithUserParams:(ESKUser *)user;

@end

@protocol ESKNetworkAuthenticateDelegate <NSObject>
/**
 Tells delegate that authorization was completed successfully and return its email password and got token
 
 @param user object ESKUser that was passed for request with recieved userID and token
 */
- (void)authorizationSuccessForUser:(ESKUser *)user;

/**
 Tells delegate that authorization was completed unsuccessfully and request return NSError
 
 @param error NSError object of error
 */
- (void)authorizationUnsuccessWithError:(NSError *)error;


/**
 Tells delegate that authorization was completed unsuccessfully and request returned response with error
 
 @param errorMessage server response body for request
 */
- (void)authorizationUnsuccessWithResponse:(NSDictionary *)errorMessage;

@end



@protocol ESKNetworkRegistrate <NSObject>
/**
 Send registration request that will callback response to registrationDelegate by AuthorizationServiceRegistrationDelegate.
 
 @param user Object ESKUser with email, name and password
 */
- (void)registerWithUserParams:(ESKUser *)user;

@end

@protocol ESKNetworkRegistrationDelegate <NSObject>
/**
 Tells delegate that registration was completed successfully and return its email password and got token
 
 @param user object ESKUser that was passed for request with recieved userID and token
 */
- (void)registrationSuccessForUser:(ESKUser *)user;

/**
 Tells delegate that registration was completed unsuccessfully and request return NSError
 
 @param error NSError object of error
 */
- (void)registrationUnsuccessWithError:(NSError *)error;

/**
 Tells delegate that registration was completed unsuccessfully and request returned response with error
 
 @param errorMessage server response body for request
 */
- (void)registrationUnsuccessWithResponse:(NSDictionary *)errorMessage;

@end

