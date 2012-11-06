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
#import "NSURLHTTPClient.h"

@implementation WebServiceSessionSourceIntegrationTest

#pragma mark - Factory methods

- (id<SessionStorage>)createEmptyStubbedSessionStorage
{
    InMemorySessionStorage *sessionStorage = [InMemorySessionStorage new];
    sessionStorage.session = nil;
    return sessionStorage;
}

- (id<HTTPClient>)createHTTPClient
{
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.queue = [NSOperationQueue new];
    httpClient.asyncRequestSender = [NSURLConnectionAsyncRequestSender new];
    return httpClient;
}


#pragma mark - Tests

- (void)test_itGetsANewSession_viaTheWebService_ifNotFoundInStorage
{
    WebServiceSessionSource *ws = [WebServiceSessionSource new];
    ws.sessionStorage = [self createEmptyStubbedSessionStorage];
    ws.httpClient = [self createHTTPClient];
    
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
