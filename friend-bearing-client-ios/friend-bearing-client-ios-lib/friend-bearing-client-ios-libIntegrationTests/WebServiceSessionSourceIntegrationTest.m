//
//  WebServiceSessionSourceIntegrationTest.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "WebServiceSessionSourceIntegrationTest.h"
#import "WebServiceSessionSource.h"
#import "InMemorySessionStorage.h"
#import "TestUtils.h"
#import "AsyncRequestSender.h"
#import "NSURLConnectionAsyncRequestSender.h"

@implementation WebServiceSessionSourceIntegrationTest

- (void)test_itGetsANewSession_viaTheWebService_ifNotFoundInStorage
{
    WebServiceSessionSource *ws = [WebServiceSessionSource new];
    InMemorySessionStorage *sessionStorage = [InMemorySessionStorage new];
    sessionStorage.session = nil;
    ws.sessionStorage = sessionStorage;
    ws.queue = [NSOperationQueue new];
    ws.asyncRequestSender = [NSURLConnectionAsyncRequestSender new];
    
    __block NSString *userID = nil;
    __block BOOL completed = NO;
    [ws getCurrentSessionAndSucceed:^(Session *s) {
        userID = s.userID;
        completed = YES;
    } orFail:nil];
    
    STAssertFalse([TestUtils didWaitAnUnreasonableTimeForTruth:&completed], nil);
    STAssertEqualObjects(userID, @"123", nil);
}

@end
