//
//  FakedFriendHeadingSource.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-20.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendHeadingSource.h"

@interface FakedFriendHeadingSource : NSObject <FriendHeadingSource>

@property NSString *wasCalledWithFriendID;

@end
