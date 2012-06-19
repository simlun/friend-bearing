//
//  FriendLocatorDisplay.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-06-13.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendLocatorPresenter.h"

@protocol FriendLocatorDisplay <NSObject>

@property (nonatomic, strong) FriendLocatorPresenter* presenter;

@end
