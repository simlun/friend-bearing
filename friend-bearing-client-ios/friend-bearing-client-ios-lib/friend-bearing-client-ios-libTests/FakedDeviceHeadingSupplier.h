//
//  FakedDeviceHeadingSupplier.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-21.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceHeadingSupplier.h"

@interface FakedDeviceHeadingSupplier : NSObject <DeviceHeadingSupplier>

- (void)simulateDeviceHeadingUpdate;

@end
