//
//  ESKProfileProtocols.h
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//
@class ESKUser;
@protocol ESKProfileViewDelegate <NSObject>

/**
 Tells to delegate(ViewController) that exit button was pressed
 */
- (void)exitButtonPressed;

- (void)changeValue:(NSString *)value inRow:(NSInteger)number;

- (void)userInfoChangingRequest;

- (void)cancelAllChanges;

@end
