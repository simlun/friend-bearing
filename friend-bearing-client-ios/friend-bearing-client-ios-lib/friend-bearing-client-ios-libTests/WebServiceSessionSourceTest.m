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

- (id<HTTPClient>)createStubbedHTTPClient
{
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    StubbedAsyncRequestSender *requestSender = [StubbedAsyncRequestSender new];
    requestSender.error = [NSError errorWithDomain:@"se.simlun" code:0 userInfo:nil];
    httpClient.asyncRequestSender = requestSender;
    return httpClient;
}

- (void)test_itFails_cleanly_onNSError
{
    WebServiceSessionSource *ws = [WebServiceSessionSource new];
    ws.httpClient = [self createStubbedHTTPClient];
    
    __block BOOL didFail = NO;
    [ws getCurrentSessionAndSucceed:nil orFail:^(NSString *errorMessage) {
        didFail = YES;
    }];
    
    STAssertTrue(didFail, nil);
}


@end
