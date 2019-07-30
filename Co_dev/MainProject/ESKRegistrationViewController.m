//
//  RegistrationViewController.m
//  MainProject
//
//  Created by Gagik on 12/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKRegistrationViewController.h"
#import "ESKRegistrationView.h"
#import "ESKAuthorizationService.h"
#import "ESKRegistrationPresenter.h"
#import "ESKRegistrationProtocols.h"

@interface ESKRegistrationViewController ()<ESKCloseDraggableViewDelegate, ESKRegistrationViewDelegate>

@property (nonatomic, strong) ESKRegistrationView *registrationView;

@end

@implementation ESKRegistrationViewController

#pragma mark - ViewController Lify Cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalTransitionStyle = 0;
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ESKRegistrationPresenter *presenter = [ESKRegistrationPresenter new];
    self.registrationView = [[ESKRegistrationView alloc] init];
    self.registrationView.closeDelegate = self;
    self.registrationView.delegate = self;
    self.registrationView.presenter = presenter;
    presenter.delegate = self.registrationView;
    self.view = self.registrationView;
}


#pragma mark - ESKRegistrationViewDelegate

- (void)closeAllModals
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
//    [self dismissViewControllerAnimated:YES completion:^{
//        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
//    }];
}


#pragma mark - ESKCloseDraggableViewDelegate

- (void)closeViewDragged:(CGPoint)translation
{
    if (translation.y < 0 )
    {
        return;
    }
    if (translation.y < CGRectGetHeight(self.view.frame) * 0.6f){
        self.registrationView.frame = CGRectMake(0, translation.y, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
        return;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)draggingDidEnd
{
    [UIView animateWithDuration:0.3f animations:^{
        self.registrationView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    }];
}


#pragma mark - UIContentContainer

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    self.view.frame = CGRectMake(0, 0, size.width, size.height);
}

@end
