//
//  ESKAuthorizedProfileView.m
//  MainProject
//
//  Created by Gagik on 26/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKProfileView.h"
#import "ESKConstants.h"
#import "ESKProfileModel.h"
#import "ESKArcView.h"
#import "ESKUser.h"
#import "ESKProfileTableCell.h"
#import "ESKProfileTextView.h"

@interface ESKProfileView ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIButton *changeButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *exitButton;

@end

@implementation ESKProfileView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}


#pragma mark - Outer interface

- (void)setTableViewDataSource:(id<UITableViewDataSource>)controller
{
    self.tableView.dataSource = controller;
}

- (void)setTableViewDelegate:(id<UITableViewDelegate>)controller
{
    self.tableView.delegate = controller;
}

- (void)rebuildProfileInformation
{
    [self.cancelButton setHidden:YES];
    [self.changeButton setHidden:YES];
    [self.tableView reloadData];
}


#pragma mark - Button Actions

- (void)exitButtonAction
{
    [self.delegate exitButtonPressed];
}

- (void)changeButtonAction
{
    [self.delegate userInfoChangingRequest];
}

- (void)cancelButtonAction
{
    [self.cancelButton setHidden:YES];
    [self.changeButton setHidden:YES];
    [self.delegate cancelAllChanges];
    [self.tableView reloadData];
}


#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView
{
    if (![textView isMemberOfClass:[ESKProfileTextView class]])
    {
        return;
    }
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    [self.cancelButton setHidden:NO];
    [self.changeButton setHidden:NO];
    [self.delegate changeValue:textView.text inRow:((ESKProfileTextView *)textView).indexPath.section];
}


#pragma mark - Private methods

- (void)createUI
{
    self.backgroundColor = [UIColor grayColor];
    
    ESKArcView *footer = [[ESKArcView alloc] init];
    [self addSubview:footer];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.estimatedRowHeight = 60;
    _tableView.allowsSelection = NO;
    [_tableView setContentInset:UIEdgeInsetsMake(0,0,100,0)];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [_tableView registerClass:[ESKProfileTableCell class] forCellReuseIdentifier:userInfoCell];
    [footer addSubview:_tableView];
    
    _imageView = [UIImageView new];
    _imageView.image = [UIImage imageNamed:@"img"];
    _imageView.layer.cornerRadius = 50.;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    _imageView.layer.borderWidth = 3.;
    _imageView.layer.borderColor = UIColor.darkGrayColor.CGColor;
    [self addSubview:_imageView];
    
    _exitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _exitButton.backgroundColor = [UIColor colorWithRed:255/255.f green:64/255.f blue:64/255.f alpha:1];
    [_exitButton setTitle:@"Exit Account" forState:UIControlStateNormal];
    _exitButton.layer.borderWidth = 2.f;
    _exitButton.layer.borderColor = [UIColor darkTextColor].CGColor;
    [_exitButton addTarget:self action:@selector(exitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_exitButton];
    
    _changeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _changeButton.backgroundColor = [UIColor greenColor];
    [_changeButton setTitle:@"Change" forState:UIControlStateNormal];
    _changeButton.layer.cornerRadius = 5;
    _changeButton.tintColor = [UIColor whiteColor];
    [_changeButton setHidden:YES];
    [_changeButton addTarget:self action:@selector(changeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [footer addSubview:_changeButton];
    
    _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _cancelButton.backgroundColor = [UIColor grayColor];
    _cancelButton.tintColor = [UIColor blackColor];
    [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    _cancelButton.layer.cornerRadius = 5;
    [_cancelButton setHidden:YES];
    [_cancelButton addTarget:self action:@selector(cancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [footer addSubview:_cancelButton];
    
    footer.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _changeButton.translatesAutoresizingMaskIntoConstraints = NO;
    _cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    _exitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray<NSLayoutConstraint *> *constraints =
    @[
      [footer.topAnchor constraintEqualToAnchor:_imageView.bottomAnchor constant:30],
      [footer.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
      [footer.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
      [footer.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
      
      [_imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
      [_imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:30],
      [_imageView.widthAnchor constraintEqualToAnchor:_imageView.heightAnchor multiplier:1],
      [_imageView.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:0.25],
      
      [_tableView.topAnchor constraintEqualToAnchor:footer.topAnchor constant:40],
      [_tableView.leadingAnchor constraintEqualToAnchor:footer.leadingAnchor],
      [_tableView.trailingAnchor constraintEqualToAnchor:footer.trailingAnchor],
      
      [_cancelButton.topAnchor constraintEqualToAnchor:_tableView.bottomAnchor constant:10],
      [_cancelButton.leadingAnchor constraintEqualToAnchor:footer.leadingAnchor constant:30],
      [_cancelButton.bottomAnchor constraintEqualToAnchor:footer.bottomAnchor constant:-20],
      [_cancelButton.widthAnchor constraintEqualToAnchor:_changeButton.widthAnchor],
      [_changeButton.leadingAnchor constraintEqualToAnchor:_cancelButton.trailingAnchor constant:30],
      [_changeButton.trailingAnchor constraintEqualToAnchor:footer.trailingAnchor constant:-30],
      [_changeButton.bottomAnchor constraintEqualToAnchor:_cancelButton.bottomAnchor],
      
      [_exitButton.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15],
      [_exitButton.topAnchor constraintEqualToAnchor:self.topAnchor constant:15]
      ];
    
    [NSLayoutConstraint activateConstraints:constraints];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

@end
