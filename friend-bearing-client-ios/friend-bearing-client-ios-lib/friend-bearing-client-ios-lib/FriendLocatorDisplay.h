//
//  FriendLocatorDisplay.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-06-13.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FriendLocatorDisplay <NSObject>

@property (nonatomic) BOOL deviceIsPointingAtFriend;
@property (nonatomic) BOOL isFriendHeadingLoaded;

@end

