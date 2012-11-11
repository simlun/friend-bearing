//
//  FakedFriendBearingSource.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-20.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FakedFriendBearingSource.h"

@implementation FakedFriendBearingSource

@synthesize wasCalledWithFriendID = _wasCalledWithFriendID;

- (void)getBearingOf:(NSString*)friendID andSucceed:(SuccessfulFriendBearingSourceBlock_t)succeed orFail:(FailedFriendBearingSourceBlock_t)fail
{
    self.wasCalledWithFriendID = friendID;
    succeed(45.0);
}

@end
