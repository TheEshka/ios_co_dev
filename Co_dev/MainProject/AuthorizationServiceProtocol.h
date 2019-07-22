//
//  AuthorizationProtocol.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol AuthorizationServiceIntputProtocol <NSObject>

/**
 Configure NSURLSessions of AuthorizationService with headers

 @param params dictionary of headers
 */
- (void)configureUrlSessionWithParams:(NSDictionary *)params;


/**
 Send authorization request that will callback response to self.authorizationDelegate by AuthorizationServiceAuthorizationDelegate

 @param email NSString with email
 @param password NSString with password
 */
- (void)authorizeWithEmail:(NSString *)email andPassword:(NSString *)password;


/**
 Send registration request that will callback response to self.registrationDelegate by AuthorizationServiceRegistrationDelegate.

 @param email NSString with email
 @param password NSString with password
 */
- (void)registerWithEmail:(NSString *)email andPassword:(NSString *)password;

@end


@protocol AuthorizationServiceAuthothicationDelegate <NSObject>

- (void)authorizationSuccessForEmail:(NSString *)email
                       withPassword:(NSString *)password
                           andToken:(NSString *)token;
- (void)authorizationUnsuccessWithError:(NSError *)error;
- (void)authorizationUnsuccessWithResponse:(NSDictionary *)errorMessage;

@end

@protocol AuthorizationServiceRegistrationDelegate <NSObject>

- (void)registrationSuccessForEmail:(NSString *)email
                       withPassword:(NSString *)password
                           andToken:(NSString *)token;
- (void)registrationUnsuccessWithError:(NSError *)error;
- (void)registrationUnsuccessWithResponse:(NSDictionary *)errorMessage;

@end
