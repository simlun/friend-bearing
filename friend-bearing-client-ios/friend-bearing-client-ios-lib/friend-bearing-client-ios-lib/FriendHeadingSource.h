//
//  FriendHeadingSource.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-20.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FriendHeadingSource <NSObject>

typedef void (^SuccessfulFriendHeadingSourceBlock_t)(double);
typedef void (^FailedFriendHeadingSourceBlock_t)(NSString *);

- (void)getHeadingOf:(NSString*)friendID andSucceed:(SuccessfulFriendHeadingSourceBlock_t)succeed orFail:(FailedFriendHeadingSourceBlock_t)fail;

@end
