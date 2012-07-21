//
//  FakedDeviceHeadingSupplier.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-21.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FakedDeviceHeadingSupplier.h"

@implementation FakedDeviceHeadingSupplier

@synthesize receiver = _receiver;

- (void)simulateDeviceHeadingUpdate
{
    [self.receiver setDeviceHeading:123.0];
}

@end
