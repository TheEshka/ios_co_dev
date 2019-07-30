//
//  ESKMemberCell.h
//  MainProject
//
//  Created by Gagik on 30/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ESKUser;
NS_ASSUME_NONNULL_BEGIN

@interface ESKMemberCell : UITableViewCell

- (void)setUser:(ESKUser *)user;

@end

NS_ASSUME_NONNULL_END
