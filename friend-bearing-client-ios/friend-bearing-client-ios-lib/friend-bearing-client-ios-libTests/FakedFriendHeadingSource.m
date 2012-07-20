//
//  FakedFriendHeadingSource.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-20.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FakedFriendHeadingSource.h"

@implementation FakedFriendHeadingSource

@synthesize wasCalledWithFriendID = _wasCalledWithFriendID;

- (void)getHeadingOf:(NSString*)friendID andSucceed:(SuccessfulFriendHeadingSourceBlock_t)succeed orFail:(FailedFriendHeadingSourceBlock_t)fail
{
    self.wasCalledWithFriendID = friendID;
    succeed(45.0);
}

@end
