//
//  DeviceHeadingSupplier.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-21.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceHeadingReceiver.h"

@protocol DeviceHeadingSupplier <NSObject>

@property (nonatomic) id<DeviceHeadingReceiver> receiver;

@end
