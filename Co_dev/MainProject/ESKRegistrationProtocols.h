//
//  RegistrationProtocol.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@class ESKUser;

@protocol ESKRegistrationViewPresenter <NSObject>
/**
 Tells delegate that registration button was pressed and pass login and password from text fields

 @param user Object ESKUser with params from AuthenticationView
 */
- (void)registrationButtonPressedWithUserParams:(ESKUser *)user;

@end


@protocol ESKRegistrationViewDelegate <NSObject>
/**
 Tells delegate to close him
 */
- (void)closeAllModals;

@end


@protocol ESKRegistrationPresenterDelegate <NSObject>
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
