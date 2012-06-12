//
//  FakeChooseFriendDisplay.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FakeChooseFriendDisplay.h"

@implementation FakeChooseFriendDisplay

@synthesize state = _state;

@synthesize userID = _userID;

- (void)showFriendLocatorDisplay
{
    self.state = @"Shows friend locator display";
}

@end
