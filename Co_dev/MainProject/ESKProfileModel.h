//
//  Presenter.h
//  MainProject
//
//  Created by Gagik on 28/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESKProfileModelProtocol.h"
#import "ESKNetworkServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESKProfileModel : NSObject<ESKProfileModelInput, ESKNetworkServiceProfileOutputProtocol>

@property (nonatomic, weak) id<ESKProfileModelIOutput> delegate;

@property (nonatomic, strong) id<ESKNetworkServiceIntputProtocol> networkService;

@end

NS_ASSUME_NONNULL_END
