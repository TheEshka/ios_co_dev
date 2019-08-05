//
//  ESKWallPostCell.m
//  MainProject
//
//  Created by Gagik on 27/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKWallPostCell.h"
#import "ESKConstants.h"

@interface ESKWallPostCell ()

@property (nonatomic, strong) UIImageView *postImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subjectLabel;
@property (nonatomic, strong) UILabel *createdTimeLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UIButton *responseButton;

@end


@implementation ESKWallPostCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    _postImage = [[UIImageView alloc] init];
    _postImage.contentMode = UIViewContentModeScaleAspectFill;
    _postImage.clipsToBounds = YES;
    _postImage.layer.borderWidth = 3.;
    _postImage.layer.borderColor = UIColor.darkGrayColor.CGColor;
    [self addSubview:_postImage];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.font = [UIFont systemFontOfSize:40];
    _titleLabel.numberOfLines = 1;
    [self addSubview:_titleLabel];
    
    _subjectLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _subjectLabel.font = [UIFont systemFontOfSize:30];
    _subjectLabel.numberOfLines = 1;
    [self addSubview:_subjectLabel];
    
    _createdTimeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _createdTimeLabel.font = [UIFont systemFontOfSize:10];
    _createdTimeLabel.textColor = [UIColor colorWithRed:155/255.f green:161/255.f blue:171/255.f alpha:1];
    _createdTimeLabel.numberOfLines = 1;
    _createdTimeLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:_createdTimeLabel];
    
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _descriptionLabel.numberOfLines = 0;
    [self addSubview:_descriptionLabel];
    
    _responseButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_responseButton setTitle:@"Откликнуться" forState:UIControlStateNormal];
    _responseButton.backgroundColor = [UIColor greenColor];
    _responseButton.layer.cornerRadius = 5;
    _responseButton.tintColor = [UIColor whiteColor];
    [_responseButton addTarget:self action:@selector(responseButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_responseButton];
    
    _authorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _authorLabel.numberOfLines = 1;
    _authorLabel.textColor = [UIColor colorWithRed:155/255.f green:161/255.f blue:171/255.f alpha:1];
    [self addSubview:_authorLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    lineView.backgroundColor = [UIColor colorWithRed:226/255.0f green:228/255.0f blue:232/255.0f alpha:1];
    [self addSubview:lineView];
    
    _postImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _subjectLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _createdTimeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _responseButton.translatesAutoresizingMaskIntoConstraints = NO;
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray<NSLayoutConstraint *> *constraints =
    @[
      [_postImage.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:8],
      [_postImage.topAnchor constraintEqualToAnchor:self.topAnchor constant:8],
      [_postImage.heightAnchor constraintEqualToConstant:100],
      [_postImage.widthAnchor constraintEqualToConstant:100],
      
      [_titleLabel.topAnchor constraintEqualToAnchor:_postImage.topAnchor],
      [_titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-8],
      [_titleLabel.leadingAnchor constraintEqualToAnchor:_postImage.trailingAnchor constant:8],
      
      [_subjectLabel.topAnchor constraintEqualToAnchor:_titleLabel.bottomAnchor],
      [_subjectLabel.trailingAnchor constraintEqualToAnchor:_titleLabel.trailingAnchor],
      [_subjectLabel.leadingAnchor constraintEqualToAnchor:_titleLabel.leadingAnchor],
      
      [_createdTimeLabel.bottomAnchor constraintEqualToAnchor:_postImage.bottomAnchor],
      [_createdTimeLabel.trailingAnchor constraintEqualToAnchor:_titleLabel.trailingAnchor],
      [_createdTimeLabel.leadingAnchor constraintEqualToAnchor:_titleLabel.leadingAnchor],
      
      [_descriptionLabel.topAnchor constraintEqualToAnchor:_postImage.bottomAnchor constant:8],
      [_descriptionLabel.leadingAnchor constraintEqualToAnchor:_postImage.leadingAnchor],
      [_descriptionLabel.trailingAnchor constraintEqualToAnchor:_titleLabel.trailingAnchor],
      
      [lineView.topAnchor constraintEqualToAnchor:_descriptionLabel.bottomAnchor constant:8],
      [lineView.heightAnchor constraintEqualToConstant:0.5f],
      [lineView.leadingAnchor constraintEqualToAnchor:_postImage.leadingAnchor],
      [lineView.trailingAnchor constraintEqualToAnchor:_titleLabel.trailingAnchor],
      
      [_responseButton.topAnchor constraintEqualToAnchor:_authorLabel.topAnchor],
      [_responseButton.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:8],
      [_responseButton.widthAnchor constraintEqualToConstant:ESKStandartButtonWidth],
      [_responseButton.bottomAnchor constraintEqualToAnchor:_authorLabel.bottomAnchor],
      
      [_authorLabel.topAnchor constraintEqualToAnchor:lineView.bottomAnchor constant:8],
      [_authorLabel.heightAnchor constraintEqualToConstant:40],
      [_authorLabel.trailingAnchor constraintEqualToAnchor:_titleLabel.trailingAnchor],
      [_authorLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-8],
      
      [self.widthAnchor constraintEqualToConstant:self.frame.size.width]
      ];
    [NSLayoutConstraint activateConstraints:constraints];
}


- (void)responseButtonAction
{
    self.postImage.image = nil;
}


- (void)setPost:(ESKPost *)post
{
    _post = post;
    self.titleLabel.text = post.postTitle;
    self.subjectLabel.text = post.postSubject;
    self.createdTimeLabel.text = post.postCreatedTime;
    self.descriptionLabel.text = post.postDescription;
    self.authorLabel.text = post.postAuthor.name;
    if (!post.postImage.imageID)
    {
        self.postImage.image = [UIImage imageNamed:@"favicon"];
        return;
    }
    self.postImage.image = post.postImage.image;
}

- (void)setImage:(UIImage *)image
{
    self.post.postImage.image = image;
    self.postImage.image = image;
}


@end
