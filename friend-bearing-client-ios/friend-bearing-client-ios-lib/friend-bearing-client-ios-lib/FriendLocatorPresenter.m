//
//  FriendLocatorPresenter.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-06-12.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FriendLocatorPresenter.h"

#define PRECISION 10.0

@implementation FriendLocatorPresenter

@synthesize display = _display;

@synthesize friendID = _friendID;
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

- (void)updateDisplay
{
    self.display.deviceIsPointingAtFriend = [self areHeadingsCloseEnough];
}

- (void)setDeviceHeading:(double)deviceHeading
{
    _deviceHeading = deviceHeading;
    [self updateDisplay];
}

@end
