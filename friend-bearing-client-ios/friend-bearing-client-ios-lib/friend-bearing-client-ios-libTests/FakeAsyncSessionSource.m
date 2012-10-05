//
//  FakeSessionSource.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FakeAsyncSessionSource.h"

@interface FakeAsyncSessionSource()
@property (nonatomic, strong) NSString *fixedUserID;
@property (nonatomic, strong) Session *session;
@property (nonatomic, strong) SuccessfulSessionSourceBlock_t succeed;
@end

@implementation FakeAsyncSessionSource

@synthesize fixedUserID = _fixedUserID;
@synthesize succeed = _succeed;

- (id)initWithFixedUserID:(NSString*)userID
{
    self = [super init];
    if (self) {
        self.fixedUserID = userID;
    }
    return self;
}

- (void)getCurrentSessionAndSucceed:(SuccessfulSessionSourceBlock_t)succeed orFail:(FailedSessionSourceBlock_t)fail
{
    self.session = [Session new];
    self.session.userID = self.fixedUserID;
    self.succeed = succeed;
}

- (void)doneLoading
{
    self.succeed(self.session);
}

@end
