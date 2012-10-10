//
//  TestUtils.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "TestUtils.h"

@implementation TestUtils

+ (BOOL)didWaitForMoreThan:(NSTimeInterval)seconds secondsForTruth:(BOOL*)completed
{
    for (int i = 0; !*completed; i++) {
        if (i > seconds * 1000) {
            return YES;
        }
        [NSThread sleepForTimeInterval:0.001];
    }
    return NO;
}

@end
