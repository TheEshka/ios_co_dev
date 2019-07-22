//
//  AuthenticationProtocol.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol AuthenticationViewDelegate <NSObject>

- (void)loginButtonPressedWithEmail:(NSString *)email andPassword:(NSString *)password;
- (void)goToRegistrationButtonPressed;

@end

@protocol AuthenticationViewActivity <NSObject>

- (void)authorizationSuccess;
- (void)authorizationUnsuccessWithMessage:(NSString *)message;

@end
