//
//  URLFactorySpy.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-15.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "URLFactorySpy.h"

@implementation URLFactorySpy

- (NSString *)buildURLForCreatingANewSession
{
    return nil;
}

- (NSString *)buildURLForGettingFriendBearingFor:(NSString *)friendID
{
    self.friendID = friendID;
    return nil;
}

@end
