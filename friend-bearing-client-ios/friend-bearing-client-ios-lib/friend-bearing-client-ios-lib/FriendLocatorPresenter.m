//
//  FriendLocatorPresenter.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-06-12.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FriendLocatorPresenter.h"

// Circular dependency
// http://stackoverflow.com/a/5425502
#import "FriendLocatorDisplay.h"

@implementation FriendLocatorPresenter

@synthesize display = _display;
@synthesize friendHeadingSource = _friendHeadingSource;

@synthesize friendID = _friendID;
@synthesize friendHeading = _friendHeading;

- (void)setFriendHeading:(double)friendHeading
{
    _friendHeading = friendHeading;
    self.display.isFriendHeadingLoaded = true;
}

- (void)updateFriendHeading
{
    SuccessfulFriendHeadingSourceBlock_t success = ^(double heading) {
        self.friendHeading = heading;
    };
    [self.friendHeadingSource getHeadingOf:self.friendID andSucceed:success orFail:nil];
}

- (void)setFriendID:(NSString *)friendID
{
    _friendID = friendID;
    [self updateFriendHeading];
}

@end
