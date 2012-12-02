//
//  FriendLocatorPresenterFactory.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-03-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FriendLocatorPresenterFactory.h"

@implementation FriendLocatorPresenterFactory

- (FriendLocatorPresenter *)build {
    FriendLocatorPresenter *f = [FriendLocatorPresenter new];
    f.friendBearingSource = self.friendBearingSource;
    f.deviceHeadingSupplier = self.deviceHeadingSupplier;
    return f;
}

@end
