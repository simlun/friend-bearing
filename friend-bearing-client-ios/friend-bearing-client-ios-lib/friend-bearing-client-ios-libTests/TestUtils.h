//
//  TestUtils.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestUtils : NSObject

+ (BOOL)didWaitForMoreThan:(NSTimeInterval)seconds secondsForTruth:(BOOL*)completed;

@end
