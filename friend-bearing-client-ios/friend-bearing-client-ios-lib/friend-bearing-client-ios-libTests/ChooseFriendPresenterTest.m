//
//  ChooseFriendPresenterTest.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "ChooseFriendPresenterTest.h"
#import "ChooseFriendPresenter.h"
#import "FakeAsyncSessionSource.h"
#import "FakeChooseFriendDisplay.h"
#import "FakeFriendLocatorPresenterFactory.h"

@implementation ChooseFriendPresenterTest

- (void)test_itGetsTheUserId_fromTheSessionSource_andDisplaysIt_asynchronously
{
    ChooseFriendPresenter *p = [ChooseFriendPresenter new];
    FakeAsyncSessionSource *fakeSessionSource = [[FakeAsyncSessionSource alloc] initWithFixedUserID:@"17"];
    p.sessionSource = fakeSessionSource;
    p.display = [FakeChooseFriendDisplay new];
    
    [p showUserID];
    
    STAssertEqualObjects(p.display.userID, @"Loading...", nil);
    
    [fakeSessionSource doneLoading];
    
    STAssertEqualObjects(p.display.userID, @"17", nil);
    
}

- (void)test_onSubmitButtonPressed_itCreatesTheFriendLocatorPresenter
{
    ChooseFriendPresenter *p = [ChooseFriendPresenter new];
    p.friendLocatorPresenterFactory = [FakeFriendLocatorPresenterFactory new];
    
    [p submitButtonPressed];
    
    STAssertNotNil(p.friendLocatorPresenter, nil);
}

- (void)test_onFriendIdEntered_andSubmitButtonPressed_itGivesTheFriendId_toTheFriendLocatorPresenter
{
    ChooseFriendPresenter *p = [ChooseFriendPresenter new];
    p.friendLocatorPresenterFactory = [FakeFriendLocatorPresenterFactory new];
    p.display = [FakeChooseFriendDisplay new];
    
    p.display.friendID = @"4711";
    [p submitButtonPressed];
    
    STAssertEqualObjects(p.friendLocatorPresenter.friendID, @"4711", nil);
}

- (void)test_onSubmitButtonPressed_itShowsTheFriendLocatorDisplay
{
    ChooseFriendPresenter *p = [ChooseFriendPresenter new];
    FakeChooseFriendDisplay *d = [FakeChooseFriendDisplay new];
    p.display = d;
    
    [p submitButtonPressed];
    
    STAssertEqualObjects(d.state, @"Shows friend locator display", nil);
}

// TODO: User must supply a friend ID, fail otherwise.

@end
