//
//  FriendBearingSource.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-20.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FriendBearingSource <NSObject>

typedef void (^SuccessfulFriendBearingSourceBlock_t)(double);
typedef void (^FailedFriendBearingSourceBlock_t)(NSString *);

- (void)getBearingOf:(NSString*)friendID andSucceed:(SuccessfulFriendBearingSourceBlock_t)succeed orFail:(FailedFriendBearingSourceBlock_t)fail;

@end


// TODO: Implement a real WebServiceFriendBearingSource
