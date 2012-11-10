//
//  NSURLHTTPClientTest.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-06.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "NSURLHTTPClientTest.h"
#import "NSURLHTTPClient.h"
#import "StubbedAsyncRequestSender.h"

@implementation NSURLHTTPClientTest

- (id<AsyncRequestSender>)createFailingAsyncRequestSender
{
    StubbedAsyncRequestSender *requestSender = [StubbedAsyncRequestSender new];
    requestSender.error = [NSError errorWithDomain:@"se.simlun" code:0 userInfo:nil];
    return requestSender;
}

- (void)test_itFailsCleanly_onNSErrorFromRequestSender
{
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.asyncRequestSender = [self createFailingAsyncRequestSender];
    
    __block BOOL didFail = NO;
    __block NSString *actualMessage;
    [httpClient doPostRequestWithURL:nil andSucceed:nil orFail:^(NSString *message) {
        didFail = YES;
        actualMessage = message;
    } expectingResponseStatus:-1];
    
    STAssertTrue(didFail, nil);
    STAssertEqualObjects(actualMessage, @"ASYNC_REQUEST_NSERROR", nil);
}

- (id<AsyncRequestSender>)createStatusCodeFailingAsyncRequestSender
{
    StubbedAsyncRequestSender *requestSender = [StubbedAsyncRequestSender new];
    NSHTTPURLResponse *urlResponse = [[NSHTTPURLResponse alloc] initWithURL:nil statusCode:500 HTTPVersion:nil headerFields:nil];
    requestSender.urlResponse = urlResponse;
    return requestSender;
}

- (void)test_itFailsCleanly_onUnexpectedStatusCode
{
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.asyncRequestSender = [self createStatusCodeFailingAsyncRequestSender];
    
    __block BOOL didFail = NO;
    __block NSString *actualMessage;
    [httpClient doPostRequestWithURL:nil andSucceed:nil orFail:^(NSString *message) {
        didFail = YES;
        actualMessage = message;
    } expectingResponseStatus:200];
    
    STAssertTrue(didFail, nil);
    STAssertEqualObjects(actualMessage, @"UNEXPECTED_HTTP_RESPONSE_STATUS", nil);
}

@end
