//
//  CoreLocationDeviceHeadingSupplier.m
//  friend-bearing-client-ios-app
//
//  Created by simlun on 2012-12-02.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "CoreLocationDeviceHeadingSupplier.h"


@interface CoreLocationDeviceHeadingSupplier()
@property (nonatomic, strong) CLLocationManager *locManager;
@end


@implementation CoreLocationDeviceHeadingSupplier

@synthesize receiver = _receiver;

- (void)startHeadingEvents {
    if (!self.locManager) {
        CLLocationManager* theManager = [[CLLocationManager alloc] init];
        
        // Retain the object in a property.
        self.locManager = theManager;
        self.locManager.delegate = self;
    }
    
    // Start location services to get the true heading.
    self.locManager.distanceFilter = 1000;
    self.locManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    [self.locManager startUpdatingLocation];
    
    // Start heading updates.
    if ([CLLocationManager headingAvailable]) {
        self.locManager.headingFilter = 5;
        [self.locManager startUpdatingHeading];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    if (newHeading.headingAccuracy < 0)
        return;
    
    // Use the true heading if it is valid.
    CLLocationDirection  theHeading = ((newHeading.trueHeading > 0) ?
                                       newHeading.trueHeading : newHeading.magneticHeading);
    
    NSLog(@"CoreLocationDeviceHeadingSupplier.locationManager:didUpdateHeading, the heading is %f", theHeading);
    [self.receiver setDeviceHeading:theHeading];
}

- (void)start
{
    NSLog(@"CLLocationManagerDeviceHeadingSupplier.start");
    [self startHeadingEvents];
}

@end
