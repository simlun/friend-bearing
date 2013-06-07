//
//  NSURLHttpClient.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-06.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "NSURLHTTPClient.h"
#import "NSJSONSerializationJSONDeserializer.h"

@implementation NSURLHTTPClient

@synthesize urlRequestSender = _urlRequestSender;
@synthesize jsonDeserializer = _jsonDeserializer;

- (void)do:(NSString *)method requestWithURL:(NSString *)urlString
                                  andSucceed:(OnSuccessBlock_t)onSucceed
                                      orFail:(OnFailureBlock_t)onFailure
                     expectingResponseStatus:(int)expectedStatus
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = method;
    
    void (^handler) (NSURLResponse *, NSData *, NSError *);
    handler = ^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            NSLog(@"HTTP request failed with error: %@", error.localizedDescription);
            onFailure(@"HTTP_REQUEST_ERROR");
            return;
        }
        
        if (expectedStatus != 0) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode != expectedStatus) {
                NSLog(@"HTTP request failed with unexpected response status code: %i", httpResponse.statusCode);
                onFailure(@"UNEXPECTED_HTTP_RESPONSE_STATUS");
                return;
            }
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [self.jsonDeserializer getDictionaryFromJSONData:data error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON parsing failed with error: %@", jsonError.localizedDescription);
            onFailure(@"JSON_ERROR");
            return;
        }
        
        NSLog(@"NSURLHTTPClient.do:requestWithURL, completionHandler succeeding!");
        onSucceed(json);
    };
    
    NSLog(@"NSURLHTTPClient.do:requestWithURL, sending request");
    [self.urlRequestSender sendRequest:request withCompletionHandler:handler];
}

- (void)doGetRequestWithURL:(NSString *)urlString
                 andSucceed:(OnSuccessBlock_t)onSucceed
                     orFail:(OnFailureBlock_t)onFailure
    expectingResponseStatus:(int)expectedStatus
{
    [self do:@"GET" requestWithURL:urlString
                        andSucceed:onSucceed
                            orFail:onFailure
           expectingResponseStatus:expectedStatus];
}

- (void)doPostRequestWithURL:(NSString *)urlString
                  andSucceed:(OnSuccessBlock_t)onSucceed
                      orFail:(OnFailureBlock_t)onFailure
     expectingResponseStatus:(int)expectedStatus
{
    [self do:@"POST" requestWithURL:urlString
                         andSucceed:onSucceed
                             orFail:onFailure
            expectingResponseStatus:expectedStatus];
}

@end
