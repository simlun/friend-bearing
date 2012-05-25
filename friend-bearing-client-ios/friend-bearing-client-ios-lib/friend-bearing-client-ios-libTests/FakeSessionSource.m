//
//  FakeSessionSource.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FakeSessionSource.h"

@interface FakeSessionSource()
@property (nonatomic, strong) NSString *fixedUserID;
@end

@implementation FakeSessionSource

@synthesize fixedUserID = _fixedUserID;

- (id)initWithFixedUserID:(NSString*)userID
{
    self = [super init];
    if (self) {
        self.fixedUserID = userID;
    }
    return self;
}

- (Session*)currentSession
{
    Session *s = [Session new];
    s.userID = self.fixedUserID;
    return s;
}

@end
