//
//  FakeSessionSource.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionSource.h"

@interface FakeAsyncSessionSource : NSObject <SessionSource>

- (id)initWithFixedUserID:(NSString*)userID;

- (void)doneLoading;

@end
