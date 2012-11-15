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
#import "StubbedFailingJSONDeserializer.h"

@implementation NSURLHTTPClientTest

- (id<AsyncRequestSender>)createFailingAsyncRequestSender
{
    StubbedAsyncRequestSender *requestSender = [StubbedAsyncRequestSender new];
    requestSender.error = [NSError errorWithDomain:@"se.simlun" code:0 userInfo:nil];
    return requestSender;
}

- (void)test_itFailsCleanly_onNSError_fromRequestSender
{
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.asyncRequestSender = [self createFailingAsyncRequestSender];
    
    __block BOOL didFail = NO;
    __block NSString *actualMessage;
    [httpClient doPostRequestWithURL:nil andSucceed:nil orFail:^(NSString *message) {
        didFail = YES;
        actualMessage = message;
    } expectingResponseStatus:0];
    
    STAssertTrue(didFail, nil);
    STAssertEqualObjects(actualMessage, @"HTTP_REQUEST_ERROR", nil);
}

- (void)test_itFailsCleanly_onUnexpectedStatusCode
{
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.asyncRequestSender = [StubbedAsyncRequestSender createAsyncRequestSenderFailingWithStatusCode500];
    
    __block BOOL didFail = NO;
    __block NSString *actualMessage;
    [httpClient doPostRequestWithURL:nil andSucceed:nil orFail:^(NSString *message) {
        didFail = YES;
        actualMessage = message;
    } expectingResponseStatus:200];
    
    STAssertTrue(didFail, nil);
    STAssertEqualObjects(actualMessage, @"UNEXPECTED_HTTP_RESPONSE_STATUS", nil);
}


- (void)test_itDoesNotCareAboutResponseStatusZero
{
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.asyncRequestSender = [StubbedAsyncRequestSender createAsyncRequestSenderFailingWithStatusCode500];
    
    __block BOOL didSucceed = NO;
    __block BOOL didFail = NO;
    [httpClient doPostRequestWithURL:nil andSucceed:^(NSDictionary *json){
        didSucceed = YES;
    } orFail:^(NSString *message) {
        didFail = YES;
    } expectingResponseStatus:0];
    
    STAssertTrue(didSucceed, nil);
    STAssertFalse(didFail, nil);
}


- (void)test_itFailsCleanly_onNSError_fromJSONDeserializer
{
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.asyncRequestSender = [StubbedAsyncRequestSender new];
    httpClient.jsonDeserializer = [StubbedFailingJSONDeserializer new];
    
    __block BOOL didFail = NO;
    __block NSString *actualMessage;
    [httpClient doPostRequestWithURL:nil andSucceed:nil orFail:^(NSString *message) {
        didFail = YES;
        actualMessage = message;
    } expectingResponseStatus:0];
    
    STAssertTrue(didFail, nil);
    STAssertEqualObjects(actualMessage, @"JSON_ERROR", nil);
}

@end
