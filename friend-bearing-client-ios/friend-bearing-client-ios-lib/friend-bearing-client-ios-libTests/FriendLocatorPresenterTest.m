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

- (void)test_itCallsTheFriendHeadingSource_withTheSuppliedFriendID_whenFriendID_isSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    FakedFriendHeadingSource *fakedHeadingSource = [FakedFriendHeadingSource new];
    p.friendHeadingSource = fakedHeadingSource;
    
    p.friendID = @"4711";
    
    STAssertEqualObjects(fakedHeadingSource.wasCalledWithFriendID, @"4711", nil);
}

- (void)test_itGetsAFriendHeading_whenFriendID_isSet
{
    FriendLocatorPresenter *p = [FriendLocatorPresenter new];
    FakedFriendHeadingSource *fakedHeadingSource = [FakedFriendHeadingSource new];
    p.friendHeadingSource = fakedHeadingSource;
    
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



// TODO: What happens when it's unable to get the friend heading?

@end
