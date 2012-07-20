//
//  FriendLocatorDisplay.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-06-13.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

// Circular dependency
// http://stackoverflow.com/a/5425502
@class FriendLocatorPresenter;


@protocol FriendLocatorDisplay <NSObject>

@property (nonatomic, strong) FriendLocatorPresenter *presenter;

@property (nonatomic) BOOL deviceIsPointingAtFriend;
@property (nonatomic) BOOL isFriendHeadingLoaded;

@end
