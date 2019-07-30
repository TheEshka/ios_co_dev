//
//  AuthorizationProtocol.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@class ESKUser;

@protocol ESKAuthorizationServiceIntputProtocol <NSObject>
/**
 Send authorization request that will callback response to authorizationDelegate by AuthorizationServiceAuthorizationDelegate

 @param user Object ESKUser with email and password
 */
- (void)authorizeWithUserParams:(ESKUser *)user;


/**
 Send registration request that will callback response to registrationDelegate by AuthorizationServiceRegistrationDelegate.

 @param user Object ESKUser with email, name and password
 */
- (void)registerWithUserParams:(ESKUser *)user;

@end


@protocol ESKAuthorizationServiceAuthethicationDelegate <NSObject>
/**
 Tells delegate that authorization was completed successfully and return its email password and got token

 @param user object ESKUser that was passed for request with recieved userID and token
 */
- (void)authorizationSuccessForUser:(ESKUser *)user;


@optional
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


@protocol ESKAuthorizationServiceRegistrationDelegate <NSObject>
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
