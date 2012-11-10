//
//  WebServiceSessionSourceTest.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-05.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "WebServiceSessionSourceTest.h"
#import "WebServiceSessionSource.h"
#import "InMemorySessionStorage.h"
#import "StubbedAsyncRequestSender.h"
#import "NSURLHTTPClient.h"
#import "StubbedFailingHTTPClient.h"
#import "StubbedSucceedingHTTPClient.h"

@implementation WebServiceSessionSourceTest


#pragma mark - Happy Path

- (id<SessionStorage>)createStubbedSessionStorage
{
    InMemorySessionStorage *sessionStorage = [InMemorySessionStorage new];
    Session *session = [Session new];
    session.userID = @"17";
    sessionStorage.session = session;
    return sessionStorage;
}

- (void)test_itReturnsTheSession_ifFoundInStorage
{
    WebServiceSessionSource *ws = [WebServiceSessionSource new];
    ws.sessionStorage = [self createStubbedSessionStorage];
    
    __block NSString *userID = nil;
    [ws getCurrentSessionAndSucceed:^(Session *s) {
        userID = s.userID;
    } orFail:nil];
    
    STAssertEqualObjects(userID, @"17", nil);
}


#pragma mark - Sad Path

- (void)test_itFails_cleanly
{
    WebServiceSessionSource *ws = [WebServiceSessionSource new];
    ws.httpClient = [StubbedFailingHTTPClient new];
    
    __block BOOL didFail = NO;
    __block NSString *actualMessage;
    [ws getCurrentSessionAndSucceed:nil orFail:^(NSString *errorMessage) {
        didFail = YES;
        actualMessage = errorMessage;
    }];
    
    STAssertTrue(didFail, nil);
    STAssertEqualObjects(actualMessage, @"STUBBED_FAILURE", nil);
}

- (void)test_itFails_onSucceededHTTPClient_butUnexpectedResponse
{
    WebServiceSessionSource *ws = [WebServiceSessionSource new];
    ws.httpClient = [StubbedSucceedingHTTPClient new];
    
    __block BOOL didFail = NO;
    __block NSString *actualMessage;
    [ws getCurrentSessionAndSucceed:nil orFail:^(NSString *errorMessage) {
        didFail = YES;
        actualMessage = errorMessage;
    }];
    
    STAssertTrue(didFail, nil);
    STAssertEqualObjects(actualMessage, @"INCOMPLETE_WEB_SERVICE_RESPONSE", nil);
}


@end
