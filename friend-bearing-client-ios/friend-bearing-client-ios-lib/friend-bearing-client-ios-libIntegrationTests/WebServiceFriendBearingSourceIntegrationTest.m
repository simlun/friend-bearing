//
//  WebServiceFriendBearingSourceIntegrationTest.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-15.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "WebServiceFriendBearingSourceIntegrationTest.h"
#import "WebServiceFriendBearingSource.h"
#import "NSURLHTTPClient.h"
#import "NSURLConnectionAsyncURLRequestSender.h"
#import "NSJSONSerializationJSONDeserializer.h"
#import "IntegrationTestURLFactory.h"
#import "NotFoundURLFactory.h"
#import "TestUtils.h"

@implementation WebServiceFriendBearingSourceIntegrationTest

#pragma mark - Happy Path

- (void)test_itGetsAFriendsBearings_viaTheWebService
{
    WebServiceFriendBearingSource *ws = [WebServiceFriendBearingSource new];

    NSURLConnectionAsyncURLRequestSender *asyncURLRequestSender = [NSURLConnectionAsyncURLRequestSender new];
    asyncURLRequestSender.queue = [NSOperationQueue new];
    
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.urlRequestSender = asyncURLRequestSender;
    httpClient.jsonDeserializer = [NSJSONSerializationJSONDeserializer new];
    ws.httpClient = httpClient;
    
    ws.urlFactory = [IntegrationTestURLFactory new];
    
    __block double actualBearings = 0;
    __block BOOL completed = NO;
    [ws getBearingOf:@"2" andSucceed:^(double bearings) {
        actualBearings = bearings;
        completed = YES;
    } orFail:^(NSString *errorMessage) {
        STFail([NSString stringWithFormat:@"Failed integration test with the following error: %@", errorMessage]);
        completed = YES;
    }];
    
    STAssertFalse([TestUtils didWaitAnUnreasonableTimeForTruth:&completed], nil);
    STAssertEqualsWithAccuracy(actualBearings, 187.14, 0.001, nil);
}


#pragma mark - Sad Path

- (void)test_itFails_onUnexpectedHTTPResponseCode
{
    WebServiceFriendBearingSource *ws = [WebServiceFriendBearingSource new];
    
    NSURLConnectionAsyncURLRequestSender *asyncURLRequestSender = [NSURLConnectionAsyncURLRequestSender new];
    asyncURLRequestSender.queue = [NSOperationQueue new];
    
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.urlRequestSender = asyncURLRequestSender;
    httpClient.jsonDeserializer = [NSJSONSerializationJSONDeserializer new];
    ws.httpClient = httpClient;
    
    ws.urlFactory = [NotFoundURLFactory new];
    
    __block BOOL completed = NO;
    __block NSString *actualMessage = nil;
    [ws getBearingOf:nil andSucceed:nil orFail:^(NSString *errorMessage) {
        actualMessage = errorMessage;
        completed = YES;
    }];
    
    STAssertFalse([TestUtils didWaitAnUnreasonableTimeForTruth:&completed], nil);
    STAssertEqualObjects(actualMessage, @"UNEXPECTED_HTTP_RESPONSE_STATUS", nil);
}

@end
