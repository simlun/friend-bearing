//
//  FakeDeviceHeadingSupplier.m
//  friend-bearing-client-ios-app
//
//  Created by simlun on 2012-12-02.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FakeDeviceHeadingSupplier.h"

@implementation FakeDeviceHeadingSupplier

@synthesize receiver = _receiver;

- (void)start
{
    NSLog(@"FakeDeviceHeadingSupplier.start");
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"FakeDeviceHeadingSupplier.start, entering async block");
        
        double heading = 0.0;
        while (true) {
            NSLog(@"FakeDeviceHeadingSupplier.start, sleeping...");
            [NSThread sleepForTimeInterval:3.0];
            NSLog(@"FakeDeviceHeadingSupplier.start, updating!");
            [self.receiver setDeviceHeading:heading];
            NSLog(@"FakeDeviceHeadingSupplier.start, updated.");

            heading += 90.0;
            if (heading >= 360) {
                heading = 0.0;
            }
        }
        
    });
}

@end
