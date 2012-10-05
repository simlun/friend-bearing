//
//  ChooseFriendPresenterFactory.m
//  friend-bearing-client-ios-app
//
//  Created by simlun on 2012-10-05.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "ChooseFriendPresenterFactory.h"
#import "FakeSleepingAsyncSessionSource.h"

@implementation ChooseFriendPresenterFactory

+ (ChooseFriendPresenter *)build
{
    ChooseFriendPresenter *p = [ChooseFriendPresenter new];
    p.friendLocatorPresenterFactory = [FriendLocatorPresenterFactory new];
    p.sessionSource = [FakeSleepingAsyncSessionSource new];
    return p;
}

@end
