//
//  IntegrationTestURLFactory.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-15.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "IntegrationTestURLFactory.h"

@implementation IntegrationTestURLFactory

- (NSString *)buildURLForCreatingANewSession
{
    return @"http://localhost:3000/session";
}

- (NSString *)buildURLForGettingFriendBearingFor:(NSString *)friendID
{
    return [NSString stringWithFormat:@"http://localhost:3000/bearing/%@", friendID];
}

@end
