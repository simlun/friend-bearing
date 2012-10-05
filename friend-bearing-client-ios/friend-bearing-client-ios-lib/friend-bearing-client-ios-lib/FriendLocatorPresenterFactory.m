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
    
    // TODO: Set friendHeadingSource
    f.friendHeadingSource = nil;
    
    // TODO: Set deviceHeadingSupplier
    f.deviceHeadingSupplier = nil;
    
    return f;
}

@end
