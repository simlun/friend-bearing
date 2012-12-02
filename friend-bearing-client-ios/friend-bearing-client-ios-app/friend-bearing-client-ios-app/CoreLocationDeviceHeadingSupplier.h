//
//  CoreLocationDeviceHeadingSupplier.h
//  friend-bearing-client-ios-app
//
//  Created by simlun on 2012-12-02.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "DeviceHeadingSupplier.h"

@interface CoreLocationDeviceHeadingSupplier : NSObject <DeviceHeadingSupplier, CLLocationManagerDelegate>
@end
