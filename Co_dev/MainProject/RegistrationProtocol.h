//
//  RegistrationProtocol.h
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol RegistrationViewDelegate <NSObject>

- (void)registrationButtonPressedWithEmail:(NSString *)login andPassword:(NSString *)password;

@end

@protocol RegistrationViewActivity <NSObject>

- (void)registrationSuccess;
- (void)registrationUnsuccessWithMessage:(NSString *)message;

@end
