//
//  ESKAuthenticationPresenter.h
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESKAuthenticationProtocols.h"
#import "ESKAuthorizationServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKAuthenticationPresenter : NSObject<ESKAuthenticationViewPresenter, ESKAuthorizationServiceAuthethicationDelegate>

@property (nonatomic, weak) id<ESKAuthenticationPresenterDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
