//
//  ESKProfileTableCellTableViewCell.h
//  MainProject
//
//  Created by Gagik on 02/08/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESKProfileTableCell : UITableViewCell

- (void)setStartValue:(NSString *)value;
- (void)setTextViewDelegate:(id<UITextViewDelegate>)controller;
- (void)setTextValueIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
