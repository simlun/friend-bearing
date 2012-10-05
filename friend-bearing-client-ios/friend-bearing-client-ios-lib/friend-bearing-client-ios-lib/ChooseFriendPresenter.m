//
//  ChooseFriendPresenter.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "ChooseFriendPresenter.h"
#import "Session.h"
#import "FriendLocatorPresenterFactory.h"

@implementation ChooseFriendPresenter

@synthesize display = _display;
@synthesize sessionSource = _sessionSource;
@synthesize friendLocatorPresenterFactory = _friendLocatorPresenterFactory;
@synthesize friendLocatorPresenter = _friendLocatorPresenter;

- (void)updateDisplay
{
    self.display.userID = self.sessionSource.currentSession.userID;
}

- (void)submitButtonPressed
{
    [self.display showFriendLocatorDisplay];
    self.friendLocatorPresenter = [self.friendLocatorPresenterFactory build];
    self.friendLocatorPresenter.friendID = self.display.friendID;
}

@end
