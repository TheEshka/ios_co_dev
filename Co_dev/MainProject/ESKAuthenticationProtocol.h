//
//  AuthenticationProtocol.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol ESKAuthenticationViewDelegate <NSObject>

/**
 Tells delegate that login button was pressed and pass login and password from text fields

 @param email text from login text field
 @param password text from login text field
 */
- (void)loginButtonPressedWithEmail:(NSString *)email andPassword:(NSString *)password;

/**
 Tells delegate that registration button was pressed
 */
- (void)goToRegistrationButtonPressed;

@end

@protocol ESKAuthenticationViewActivity <NSObject>

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
