//
//  FakeChooseFriendDisplay.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FakeChooseFriendDisplay.h"

@implementation FakeChooseFriendDisplay

@synthesize userID = _userID;
@synthesize friendID = _friendID;
@synthesize state = _state;

- (void)showFriendLocatorDisplay
{
    self.state = @"Shows friend locator display";
}

@end
