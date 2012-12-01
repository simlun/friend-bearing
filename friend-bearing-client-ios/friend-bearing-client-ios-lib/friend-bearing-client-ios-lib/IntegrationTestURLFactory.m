//
//  IntegrationTestURLFactory.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-15.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "IntegrationTestURLFactory.h"

@implementation IntegrationTestURLFactory

- (NSString *)createURLForCreatingANewSession
{
    return @"http://localhost:3000/session";
}

- (NSString *)createURLForGettingFriendBearingFor:(NSString *)friendID
{
    return [NSString stringWithFormat:@"http://localhost:3000/bearing/%@", friendID];
}

@end
