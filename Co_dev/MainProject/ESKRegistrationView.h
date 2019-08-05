//
//  RegistrationView.h
//  MainProject
//
//  Created by Gagik on 09/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKRegistrationProtocols.h"
#import "ESKCloseViewProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface ESKRegistrationView : UIView<ESKRegistrationPresenterDelegate>


@property (nonatomic, weak) id<ESKCloseDraggableViewDelegate> closeDelegate;/**< Object that act as delegate of ESKCloseDraggableView*/

@property (nonatomic, weak) id<ESKRegistrationViewDelegate> delegate;/**< Object that act as delegate of this View*/

@property (nonatomic, strong) id<ESKRegistrationViewPresenter> presenter;

@end

NS_ASSUME_NONNULL_END
