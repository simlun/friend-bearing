//
//  FriendLocatorPresenterTest.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-06-18.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FriendLocatorPresenterTest.h"
#import "FriendLocatorPresenter.h"
#import "FakedFriendLocatorDisplay.h"
#import "FakedFriendBearingSource.h"
#import "FakedDeviceHeadingSupplier.h"

@implementation FriendLocatorPresenterTest


#pragma mark - Starting and loading friend bearing

- (void)test_theDisplay_isNot_pointingAtFriend_whenStarted
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    
    STAssertFalse(p.display.deviceIsPointingAtFriend, nil);
}

- (void)test_theDisplay_showsThatFriendBearing_hasNotLoaded_whenStarted
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    
    STAssertFalse(p.display.isFriendBearingLoaded, nil);
}

- (void)test_itCallsTheFriendBearingSource_withTheSuppliedFriendId_whenFriendId_isSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    FakedFriendBearingSource *fakedSource = [FakedFriendBearingSource new];
    p.friendBearingSource = fakedSource;
    
    p.friendID = @"4711";
    
    STAssertEqualObjects(fakedSource.wasCalledWithFriendID, @"4711", nil);
}

- (void)test_itGetsAFriendBearing_whenFriendId_isSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.friendBearingSource = [FakedFriendBearingSource new];
    
    double before = p.friendBearing;
    p.friendID = @"4711";
    double after = p.friendBearing;
    
    STAssertTrue(before != after, nil);
    STAssertEqualsWithAccuracy(p.friendBearing, 45.0, 0.1, nil);
}

- (void)test_theDisplay_showsThatFriendBearing_hasLoaded_whenItIsSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    
    p.friendBearing = 17.0;
    
    STAssertTrue(p.display.isFriendBearingLoaded, nil);
}

- (void)test_theDisplay_showsThatDeviceIsPointing_inTheSameHeading_asFriendBearing
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    
    p.friendBearing = 90.0;
    p.deviceHeading = 90.0;
    
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
}

- (void)test_itDoesNotMatter_inWhichOrder_theFriendBearingOrDeviceHeading_getsSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];

    p.deviceHeading = 90.0;
    p.friendBearing = 90.0;

    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
}

- (void)test_itStartsTheDeviceHeadingSupplier_whenItIsSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    FakedDeviceHeadingSupplier *fakedSupplier = [FakedDeviceHeadingSupplier new];
    id<DeviceHeadingReceiver> r = p;
    fakedSupplier.receiver = r;
    
    p.deviceHeadingSupplier = fakedSupplier;
    
    STAssertTrue(fakedSupplier.isStarted, nil);
}

- (void)test_itGetsADeviceHeading_whenDeviceHeadingSource_isUpdated
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    FakedDeviceHeadingSupplier *fakedSupplier = [FakedDeviceHeadingSupplier new];
    id<DeviceHeadingReceiver> r = p;
    fakedSupplier.receiver = r;
    p.deviceHeadingSupplier = fakedSupplier;
    
    double before = p.deviceHeading;
    [fakedSupplier simulateDeviceHeadingUpdate];
    double after = p.deviceHeading;
    
    STAssertTrue(before != after, nil);
}

// TODO: What happens when it's unable to get the friend bearing?
// TODO: What happens when it's unable to get the device heading?


@end
