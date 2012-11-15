//
//  StubbedSucceedingHTTPClient.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "StubbedSucceedingHTTPClient.h"

@implementation StubbedSucceedingHTTPClient

@synthesize queue, asyncRequestSender, jsonDeserializer;

- (void)doGetRequestWithURL:(NSString *)urlString andSucceed:(OnSuccessBlock_t)onSucceed orFail:(OnFailureBlock_t)onFailure expectingResponseStatus:(int)expectedStatus
{
    onSucceed(self.stubbedResponse);
}

- (void)doPostRequestWithURL:(NSString *)urlString andSucceed:(OnSuccessBlock_t)onSucceed orFail:(OnFailureBlock_t)onFailure expectingResponseStatus:(int)expectedStatus
{
    onSucceed(self.stubbedResponse);
}

@end
