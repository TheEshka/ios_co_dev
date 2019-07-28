//
//  AuthenticationProtocol.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@class ESKUser;

@protocol ESKAuthenticationViewPresenter <NSObject>
/**
 Tells delegate that login button was pressed and pass login and password from text fields

 @param user Object ESKUser with params from AuthenticationView
 */
- (void)loginButtonPressedWithUserParams:(ESKUser *)user;

@end


@protocol ESKAuthenticationViewDelegate <NSObject>
/**
 Tells delegate that registration button was pressed
 */
- (void)registrationButtonPressed;

/**
 Tells delegate to close him
 */
- (void)close;

@end


@protocol ESKAuthenticationPresenterDelegate <NSObject>

/**
 Actions of AuthorizationView for successful registration
 */
- (void)authorizationSuccess;

/**
 Actions of AuthorizationView for unsuccessful registration

 @param message message with error
 */
- (void)authorizationUnsuccessWithMessage:(NSString *)message;

@end
