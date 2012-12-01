//
//  FakeSleepingAsyncFriendBearingSource.m
//  friend-bearing-client-ios-app
//
//  Created by simlun on 2012-11-18.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FakeSleepingAsyncFriendBearingSource.h"

@implementation FakeSleepingAsyncFriendBearingSource

- (void)getBearingOf:(NSString*)friendID andSucceed:(SuccessfulFriendBearingSourceBlock_t)succeed orFail:(FailedFriendBearingSourceBlock_t)fail
{
    NSLog(@"FakeSleepingAsyncFriendBearingSource.getBearingOf");
    NSLog(@"Getting bearing for friendID: %@", friendID);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"FakeSleepingAsyncFriendBearingSource, entering async block");
        NSLog(@"FakeSleepingAsyncFriendBearingSource, sleeping...");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"FakeSleepingAsyncFriendBearingSource, succeeding - eventually...");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"FakeSleepingAsyncFriendBearingSource, succeeding!");
            succeed(145.0);
            NSLog(@"Succeeded.");
        });
    });
}

@end
