//
//  ESKProfileTableCellTableViewCell.m
//  MainProject
//
//  Created by Gagik on 02/08/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKProfileTableCell.h"
#import "ESKProfileTextView.h"

@interface ESKProfileTableCell ()

@property (nonatomic, strong) ESKProfileTextView *textView;

@end

@implementation ESKProfileTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _textView = [[ESKProfileTextView alloc] initWithFrame:CGRectZero];
        _textView.scrollEnabled = NO;
        _textView.font = [UIFont systemFontOfSize:16];
        [self addSubview:_textView];
        _textView.translatesAutoresizingMaskIntoConstraints = NO;
        [_textView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [_textView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [_textView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        [_textView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Outer Interface

- (void)setStartValue:(NSString *)value
{
    self.textView.text = value;
}

- (void)setTextViewDelegate:(id<UITextViewDelegate>)controller
{
    self.textView.delegate = controller;
}

- (void)setTextValueIndexPath:(NSIndexPath *)indexPath
{
    self.textView.indexPath = indexPath;
}

@end
