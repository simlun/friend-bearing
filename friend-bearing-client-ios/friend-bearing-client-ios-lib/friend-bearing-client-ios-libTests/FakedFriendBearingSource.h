//
//  FakedFriendBearingSource.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-20.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendBearingSource.h"

@interface FakedFriendBearingSource : NSObject <FriendBearingSource>

@property NSString *wasCalledWithFriendID;

@end
