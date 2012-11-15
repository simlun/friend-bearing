//
//  NotFoundURLFactory.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-15.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "NotFoundURLFactory.h"

@implementation NotFoundURLFactory

- (NSString *)createURLForCreatingANewSession
{
    return @"http://localhost:3000/SHOULD_BE_404_NOT_FOUND";
}

- (NSString *)createURLForGettingFriendBearingFor:(NSString *)friendID
{
    return @"http://localhost:3000/SHOULD_BE_404_NOT_FOUND";
}

@end
