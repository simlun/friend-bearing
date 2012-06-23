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

- (void)test_theDisplay_showsThatFriendHeading_hasLoaded_friendHeadingIsSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    
    p.friendHeading = 17.0;
    
    STAssertTrue(p.display.isFriendHeadingLoaded, nil);
}


#pragma mark - Pointing the device at friends heading

- (void)test_theDisplay_isNot_pointingAtFriend_whenDeviceIsPointed_awayFromFriend
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    
    p.friendHeading = 45.0;
    p.deviceHeading = 0.0;
    
    STAssertFalse(p.display.deviceIsPointingAtFriend, nil);
}

- (void)test_theDisplay_is_pointingAtFriend_whenDeviceIsPointed_directlyAtAFriend
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    
    p.friendHeading = 45.0;
    p.deviceHeading = 45.0;
    
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
}

- (void)test_theDisplayPointing_canSwitchBackAndForth
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    p.friendHeading = 45.0;
    
    p.deviceHeading = 45.0;
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
    
    p.deviceHeading = 0.0;
    STAssertFalse(p.display.deviceIsPointingAtFriend, nil);
    
    p.deviceHeading = 45.0;
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
}

- (void)test_theDisplay_is_pointingAtFriend_whenDeviceIsPointed_almostAtAFriend
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    p.friendHeading = 20.0;
    
    p.deviceHeading = 10.0;
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
    
    p.deviceHeading = 30.0;
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
}

- (void)test_itCanHandle_theFourthQuadrant
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
        
    p.friendHeading = 0.0;
    p.deviceHeading = 355.0;
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
    
    p.friendHeading = 355.0;
    p.deviceHeading = 0.0;
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
    
    p.friendHeading = 350.0;
    p.deviceHeading = 0.0;
    STAssertFalse(p.display.deviceIsPointingAtFriend, nil);
    
    p.friendHeading = 350.1;
    p.deviceHeading = 0.0;
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
    
    p.friendHeading = 359.0;
    p.deviceHeading = 355.0;
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
    
    p.friendHeading = 355.0;
    p.deviceHeading = 359.0;
    STAssertTrue(p.display.deviceIsPointingAtFriend, nil);
}

- (void)test_theDisplay_isNot_pointingAtFriend_whenDeviceIsPointed_almostAlmostAtAFriend
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    p.display = [FakedFriendLocatorDisplay new];
    p.friendHeading = 20.0;
    
    p.deviceHeading = 9.9;
    STAssertFalse(p.display.deviceIsPointingAtFriend, nil);
    
    p.deviceHeading = 30.1;
    STAssertFalse(p.display.deviceIsPointingAtFriend, nil);
}

@end
