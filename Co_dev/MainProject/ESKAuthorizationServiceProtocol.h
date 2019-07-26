//
//  AuthorizationProtocol.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol ESKAuthorizationServiceIntputProtocol <NSObject>

/**
 Configure NSURLSessions of AuthorizationService with NSDictionary of headers

 @param params dictionary of headers
 */
- (void)configureUrlSessionWithParams:(NSDictionary *)params;


/**
 Send authorization request that will callback response to authorizationDelegate by AuthorizationServiceAuthorizationDelegate

 @param email NSString with email
 @param password NSString with password
 */
- (void)authorizeWithEmail:(NSString *)email andPassword:(NSString *)password;


/**
 Send registration request that will callback response to registrationDelegate by AuthorizationServiceRegistrationDelegate.

 @param email NSString with email
 @param password NSString with password
 */
- (void)registerWithEmail:(NSString *)email andPassword:(NSString *)password;

@end


@protocol ESKAuthorizationServiceAuthethicationDelegate <NSObject>

/**
 Tells delegate that authorization was completed successfully and return its email password and got token

 @param email sended for authorization email
 @param password sended dor authorization password
 @param token got token
 */
- (void)authorizationSuccessForEmail:(NSString *)email
                       withPassword:(NSString *)password
                           andToken:(NSString *)token;

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

 @param email sended for authorization email
 @param password sended dor authorization password
 @param token got token
 */
- (void)registrationSuccessForEmail:(NSString *)email
                       withPassword:(NSString *)password
                           andToken:(NSString *)token;

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
