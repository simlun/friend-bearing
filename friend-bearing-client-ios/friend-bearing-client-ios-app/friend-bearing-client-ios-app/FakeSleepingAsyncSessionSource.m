//
//  FakeSessionSource.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FakeSleepingAsyncSessionSource.h"

@implementation FakeSleepingAsyncSessionSource

- (void)getCurrentSessionAndSucceed:(SuccessfulSessionSourceBlock_t)succeed orFail:(FailedSessionSourceBlock_t)fail
{
    NSLog(@"FakeSleepingAsyncSessionSource.getCurrentSessionAndSucceed");
    Session *session = [Session new];
    session.userID = @"17";
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"FakeSleepingAsyncSessionSource, entering async block");
        NSLog(@"FakeSleepingAsyncSessionSource, sleeping...");
        [NSThread sleepForTimeInterval:2.0];
        NSLog(@"FakeSleepingAsyncSessionSource, succeeding - eventually...");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"FakeSleepingAsyncSessionSource, succeeding!");
            succeed(session);
        });
    });
}

@end
