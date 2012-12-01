//
//  FriendLocatorPresenterFactory.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-03-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FriendLocatorPresenter.h"
#import "FriendBearingSource.h"

@interface FriendLocatorPresenterFactory : NSObject

#pragma mark - Dependencies

@property (nonatomic, strong) id<FriendBearingSource> friendBearingSource;


#pragma mark -

- (FriendLocatorPresenter *)build;

@end
