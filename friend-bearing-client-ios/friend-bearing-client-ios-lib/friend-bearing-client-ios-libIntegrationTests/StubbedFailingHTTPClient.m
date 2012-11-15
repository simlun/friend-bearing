//
//  StubbedHTTPClient.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-06.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "StubbedFailingHTTPClient.h"

@implementation StubbedFailingHTTPClient

@synthesize queue, asyncRequestSender, jsonDeserializer;

- (void)doGetRequestWithURL:(NSString *)urlString andSucceed:(OnSuccessBlock_t)onSucceed orFail:(OnFailureBlock_t)onFailure expectingResponseStatus:(int)expectedStatus
{
    onFailure(@"STUBBED_FAILURE");
}

- (void)doPostRequestWithURL:(NSString *)urlString andSucceed:(OnSuccessBlock_t)onSucceed orFail:(OnFailureBlock_t)onFailure expectingResponseStatus:(int)expectedStatus
{
    onFailure(@"STUBBED_FAILURE");
}

@end
