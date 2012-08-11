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
#import "FakedFriendHeadingSource.h"
#import "FakedDeviceHeadingSupplier.h"

@implementation FriendLocatorPresenterTest


#pragma mark - Starting and loading friend heading

- (void)test_theDisplay_isNot_pointingAtFriend_whenStarted
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    
    STAssertFalse(p.display.deviceIsPointingAtFriend, nil);
}

- (void)test_theDisplay_showsThatFriendHeading_hasNotLoaded_whenStarted
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    
    STAssertFalse(p.display.isFriendHeadingLoaded, nil);
}

- (void)test_itCallsTheFriendHeadingSource_withTheSuppliedFriendId_whenFriendId_isSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    FakedFriendHeadingSource *fakedSource = [FakedFriendHeadingSource new];
    p.friendHeadingSource = fakedSource;
    
    p.friendID = @"4711";
    
    STAssertEqualObjects(fakedSource.wasCalledWithFriendID, @"4711", nil);
}

- (void)test_itGetsAFriendHeading_whenFriendId_isSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.friendHeadingSource = [FakedFriendHeadingSource new];
    
    double before = p.friendHeading;
    p.friendID = @"4711";
    double after = p.friendHeading;
    
    STAssertTrue(before != after, nil);
    STAssertEqualsWithAccuracy(p.friendHeading, 45.0, 0.1, nil);
}

- (void)test_theDisplay_showsThatFriendHeading_hasLoaded_whenItIsSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    
    p.friendHeading = 17.0;
    
    STAssertTrue(p.display.isFriendHeadingLoaded, nil);
}

- (void)test_theDisplay_showsThatDeviceIsPointing_inTheSameHeading_asFriendHeading
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    
    p.friendHeading = 90.0;
    p.deviceHeading = 90.0;
    
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
}

- (void)test_itDoesNotMatter_inWhichOrder_theFriendOrDeviceHeading_getsSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];

    p.deviceHeading = 90.0;
    p.friendHeading = 90.0;

    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
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

// TODO: What happens when it's unable to get the friend heading?
// TODO: What happens when it's unable to get the device heading?


@end
