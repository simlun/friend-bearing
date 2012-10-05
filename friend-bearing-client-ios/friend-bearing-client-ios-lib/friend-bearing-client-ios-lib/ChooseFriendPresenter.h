//
//  ChooseFriendPresenter.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionSource.h"
#import "ChooseFriendDisplay.h"
#import "FriendLocatorPresenter.h"
#import "FriendLocatorPresenterFactory.h"

@interface ChooseFriendPresenter : NSObject

#pragma mark - Dependencies

@property (nonatomic, strong) id<ChooseFriendDisplay> display;
@property (nonatomic, strong) id<SessionSource> sessionSource;
@property (nonatomic, strong) FriendLocatorPresenterFactory *friendLocatorPresenterFactory;


#pragma mark - Data

@property (nonatomic, strong) FriendLocatorPresenter *friendLocatorPresenter;


#pragma mark - Actions

- (void)showUserID;
- (void)submitButtonPressed;

@end
