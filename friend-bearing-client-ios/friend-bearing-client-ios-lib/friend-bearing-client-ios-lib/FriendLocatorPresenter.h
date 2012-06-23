//
//  FriendLocatorPresenter.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-06-12.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendLocatorDisplay.h"

@interface FriendLocatorPresenter : NSObject

@property (nonatomic, strong) id<FriendLocatorDisplay> display;

@property (nonatomic, strong) NSString* friendID;
@property (nonatomic) double friendHeading;
@property (nonatomic) double deviceHeading;

@end
