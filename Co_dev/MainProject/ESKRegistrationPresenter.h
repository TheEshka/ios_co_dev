//
//  ESKRegistrationPresenter.h
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESKRegistrationProtocols.h"
#import "ESKNetworkServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKRegistrationPresenter : NSObject<ESKRegistrationViewPresenter, ESKNetworkRegistrationDelegate>

@property (nonatomic, weak) id<ESKRegistrationPresenterDelegate> delegate;

@property (nonatomic, strong) id<ESKNetworkRegistrate, ESKNetworkTokenSetter> registrationService;

@end

NS_ASSUME_NONNULL_END
