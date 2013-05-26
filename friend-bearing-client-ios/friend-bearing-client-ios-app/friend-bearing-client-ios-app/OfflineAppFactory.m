//
//  ChooseFriendPresenterFactory.m
//  friend-bearing-client-ios-app
//
//  Created by simlun on 2012-10-05.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "OfflineAppFactory.h"
#import "FakeSleepingAsyncSessionSource.h"
#import "FakeSleepingAsyncFriendBearingSource.h"
#import "FakeDeviceHeadingSupplier.h"

#import "CoreLocationDeviceHeadingSupplier.h"


@implementation OfflineAppFactory


#pragma mark - Private factory methods

- (id<SessionSource>)createSessionSource
{
    return [FakeSleepingAsyncSessionSource new];
}

- (id<FriendBearingSource>)createFriendBearingSource
{
    return [FakeSleepingAsyncFriendBearingSource new];
}

- (id<DeviceHeadingSupplier>)createDeviceHeadingSupplier
{
    return [FakeDeviceHeadingSupplier new];
}

- (FriendLocatorPresenterFactory *)createFriendLocatorPresenterFactory
{
    FriendLocatorPresenterFactory *factory = [FriendLocatorPresenterFactory new];
    factory.friendBearingSource = [self createFriendBearingSource];
    factory.deviceHeadingSupplier = [self createDeviceHeadingSupplier];
    return factory;
}


#pragma mark - AppFactory implementation

- (ChooseFriendPresenter *)buildChooseFriendPresenter
{
    ChooseFriendPresenter *p = [ChooseFriendPresenter new];
    p.friendLocatorPresenterFactory = [self createFriendLocatorPresenterFactory];
    p.sessionSource = [self createSessionSource];
    return p;
}

@end
