//
//  RegistrationProtocol.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol ESKRegistrationViewDelegate <NSObject>

/**
 Tells delegate that registration button was pressed and pass login and password from text fields

 @param login login
 @param password password
 */
- (void)registrationButtonPressedWithEmail:(NSString *)login andPassword:(NSString *)password;

@end

@protocol ESKRegistrationViewActivity <NSObject>

/**
 Actions of RegistrationView for successful registration
 */
- (void)registrationSuccess;

/**
Actions of RegistrationView for unsuccessful registration

 @param message message with error
 */
- (void)registrationUnsuccessWithMessage:(NSString *)message;

@end
