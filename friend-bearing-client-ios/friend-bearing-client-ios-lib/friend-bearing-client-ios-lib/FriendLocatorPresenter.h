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

#import "FriendHeadingSource.h"
#import "DeviceHeadingSupplier.h"
#import "DeviceHeadingReceiver.h"

@interface FriendLocatorPresenter : NSObject <DeviceHeadingReceiver>


#pragma mark - Dependencies

@property (nonatomic, weak) id<FriendLocatorDisplay> display;
@property (nonatomic, strong) id<FriendHeadingSource> friendHeadingSource;
@property (nonatomic, strong) id<DeviceHeadingSupplier> deviceHeadingSupplier;


#pragma mark - Data

@property (nonatomic, strong) NSString* friendID;
@property (nonatomic) double friendHeading;
@property (nonatomic) double deviceHeading;

@end
