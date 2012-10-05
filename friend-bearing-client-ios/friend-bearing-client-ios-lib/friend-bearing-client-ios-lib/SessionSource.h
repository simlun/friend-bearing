//
//  SessionSource.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Session.h"

@protocol SessionSource <NSObject>

typedef void (^SuccessfulSessionSourceBlock_t)(Session *);
typedef void (^FailedSessionSourceBlock_t)(NSString *);

- (void)getCurrentSessionAndSucceed:(SuccessfulSessionSourceBlock_t)succeed orFail:(FailedSessionSourceBlock_t)fail;

@end
