//
//  ESKRegistrationPresenter.h
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESKRegistrationProtocols.h"
#import "ESKAuthorizationServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKRegistrationPresenter : NSObject<ESKRegistrationViewPresenter, ESKAuthorizationServiceRegistrationDelegate>

@property (nonatomic, weak) id<ESKRegistrationPresenterDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
