//
//  FriendLocatorPresenter.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-06-12.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

// Circular dependency
// http://stackoverflow.com/a/5425502
@protocol FriendLocatorDisplay;

@interface FriendLocatorPresenter : NSObject

@property (nonatomic, strong) id<FriendLocatorDisplay> display;
@property (nonatomic, strong) NSString* friendID;

@end
