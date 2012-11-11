//
//  FriendLocatorPresenter.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-06-12.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FriendLocatorPresenter.h"

// Circular dependency
// http://stackoverflow.com/a/5425502
#import "FriendLocatorDisplay.h"

#import "Compass.h"

@interface FriendLocatorPresenter()
@property (nonatomic, strong) Compass *compass;
@end

@implementation FriendLocatorPresenter


#pragma mark - Dependencies

@synthesize display = _display;
@synthesize friendBearingSource = _friendBearingSource;
@synthesize deviceHeadingSupplier = _deviceHeadingSupplier;


#pragma mark - Data

@synthesize friendID = _friendID;
@synthesize friendBearing = _friendBearing;
@synthesize deviceHeading = _deviceHeading;


#pragma mark - Private Data

@synthesize compass = _compass;
- (Compass*)compass
{
    if (!_compass)
        _compass = [Compass new];
    return _compass;
}


#pragma mark - Private Helpers

- (void)updateFriendBearing
{
    SuccessfulFriendBearingSourceBlock_t success = ^(double bearing) {
        self.friendBearing = bearing;
    };
    [self.friendBearingSource getBearingOf:self.friendID andSucceed:success orFail:nil];
}

- (void)recalculateHeading
{
    self.compass.deviceHeading = self.deviceHeading;
    self.compass.friendBearing = self.friendBearing;
    self.display.deviceIsPointingAtFriend = self.compass.isPointingAtFriend;
}


#pragma mark - Data Setters
- (void)setFriendID:(NSString *)friendID
{
    _friendID = friendID;
    [self updateFriendBearing];
}

- (void)setFriendBearing:(double)friendBearing
{
    _friendBearing = friendBearing;
    self.display.isFriendBearingLoaded = true;
    [self recalculateHeading];
}

- (void)setDeviceHeading:(double)deviceHeading
{
    _deviceHeading = deviceHeading;
    [self recalculateHeading];
}

@end
