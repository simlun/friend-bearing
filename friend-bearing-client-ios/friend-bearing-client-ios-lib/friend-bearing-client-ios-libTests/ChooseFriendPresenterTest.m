//
//  ChooseFriendPresenterTest.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "ChooseFriendPresenterTest.h"
#import "ChooseFriendPresenter.h"
#import "FakeSessionSource.h"
#import "FakeChooseFriendDisplay.h"

@implementation ChooseFriendPresenterTest

- (void)test_itGetsTheUserID_fromTheSessionSource_andDisplaysIt
{
    ChooseFriendPresenter *p = [ChooseFriendPresenter new];
    p.sessionSource = [[FakeSessionSource alloc] initWithFixedUserID:@"17"];
    p.display = [FakeChooseFriendDisplay new];
    
    [p updateDisplay];

    STAssertEqualObjects(p.display.userID, @"17", nil);
}

- (void)test_itShowsTheFriendLocatorDisplay_onSubmitButtonPressed
{
    ChooseFriendPresenter *p = [ChooseFriendPresenter new];
    FakeChooseFriendDisplay *d = [FakeChooseFriendDisplay new];
    p.display = d;
    
    [p submitButtonPressed];
    
    STAssertEqualObjects(d.state, @"Shows friend locator display", nil);
}

@end
