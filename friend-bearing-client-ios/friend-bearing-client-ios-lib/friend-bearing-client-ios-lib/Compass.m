//
//  Compass.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-09.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "Compass.h"

@implementation Compass

#define PRECISION 10.0

@synthesize friendHeading = _friendHeading;
@synthesize deviceHeading = _deviceHeading;

- (BOOL)areHeadingsCloseEnough
{
    double friend = self.friendHeading;
    double device = self.deviceHeading;
    
    // Adjust the fourth quadrant
    if (friend > (360.0 - PRECISION))
        friend -= 360.0 - PRECISION;
    if (device > (360.0 - PRECISION))
        device -= 360.0 - PRECISION;
    
    return fabs(friend - device) <= PRECISION;
}

- (BOOL)isPointingAtFriend
{
    return [self areHeadingsCloseEnough];
}

@end
