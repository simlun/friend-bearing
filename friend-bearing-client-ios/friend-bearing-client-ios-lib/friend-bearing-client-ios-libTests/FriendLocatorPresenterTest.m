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

@end
