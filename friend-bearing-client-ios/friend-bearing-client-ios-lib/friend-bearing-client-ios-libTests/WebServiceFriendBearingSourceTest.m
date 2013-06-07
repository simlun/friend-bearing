//
//  WebServiceFriendBearingSourceTest.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-11.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "WebServiceFriendBearingSourceTest.h"
#import "WebServiceFriendBearingSource.h"
#import "StubbedSucceedingHTTPClient.h"
#import "StubbedFailingHTTPClient.h"
#import "NSURLHTTPClient.h"
#import "StubbedURLRequestSender.h"
#import "URLFactorySpy.h"

@implementation WebServiceFriendBearingSourceTest

#pragma mark - Happy Path

- (StubbedSucceedingHTTPClient *)createStubbedSuccessfulHTTPClient
{
    StubbedSucceedingHTTPClient *stub = [StubbedSucceedingHTTPClient new];
    NSNumber *bearing = [NSNumber numberWithDouble:47.11];
    stub.stubbedResponse = [NSDictionary dictionaryWithObject:bearing forKey:@"magnetic-bearing"];
    return stub;
}

- (void)test_itCanGetArbitraryFriendBearings_fromAWebService
{
    WebServiceFriendBearingSource *ws = [WebServiceFriendBearingSource new];
    ws.httpClient = [self createStubbedSuccessfulHTTPClient];
    
    __block double actualBearing;
    [ws getBearingOf:nil andSucceed:^(double bearing) {
        actualBearing = bearing;
    } orFail:nil];
    
    STAssertEqualsWithAccuracy(actualBearing, 47.11, 0.001, nil);
}

- (void)test_itCanAskFor_aSpecificFriends_Bearings
{
    WebServiceFriendBearingSource *ws = [WebServiceFriendBearingSource new];
    URLFactorySpy *urlFactorySpy = [URLFactorySpy new];
    ws.urlFactory = urlFactorySpy;
    
    [ws getBearingOf:@"17" andSucceed:nil orFail:nil];
    
    STAssertEqualObjects(urlFactorySpy.friendID, @"17", nil);
}


#pragma mark - Sad Path

- (StubbedSucceedingHTTPClient *)createStubbedHTTPClientWithNotExpectedResponseData
{
    StubbedSucceedingHTTPClient *stubbedHttpClient = [StubbedSucceedingHTTPClient new];
    stubbedHttpClient.stubbedResponse = [NSDictionary dictionaryWithObject:@"foo" forKey:@"not-expected"];
    return stubbedHttpClient;
}

- (void)test_itFails_onSucceededHTTPClient_butUnexpectedResponseData
{
    WebServiceFriendBearingSource *ws = [WebServiceFriendBearingSource new];
    ws.httpClient = [self createStubbedHTTPClientWithNotExpectedResponseData];
    
    __block BOOL didFail = NO;
    __block NSString *actualMessage;
    [ws getBearingOf:nil andSucceed:nil orFail:^(NSString *errorMessage) {
        didFail = YES;
        actualMessage = errorMessage;
    }];
    
    STAssertTrue(didFail, nil);
    STAssertEqualObjects(actualMessage, @"INCOMPLETE_WEB_SERVICE_RESPONSE", nil);
}

- (void)test_itFails_onFailingHTTPClient
{
    WebServiceFriendBearingSource *ws = [WebServiceFriendBearingSource new];
    ws.httpClient = [StubbedFailingHTTPClient new];
    
    __block BOOL didFail = NO;
    __block NSString *actualMessage;
    [ws getBearingOf:nil andSucceed:nil orFail:^(NSString *errorMessage) {
        didFail = YES;
        actualMessage = errorMessage;
    }];
    
    STAssertTrue(didFail, nil);
    STAssertEqualObjects(actualMessage, @"STUBBED_FAILURE", nil);
}


@end
