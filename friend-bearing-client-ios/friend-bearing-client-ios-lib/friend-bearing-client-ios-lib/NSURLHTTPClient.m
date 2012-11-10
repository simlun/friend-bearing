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

@synthesize queue = _queue;
@synthesize asyncRequestSender = _asyncRequestSender;
@synthesize jsonDeserializer = _jsonDeserializer;

- (void)doPostRequestWithURL:(NSString *)urlString andSucceed:(OnSuccessBlock_t)onSucceed orFail:(OnFailureBlock_t)onFailure expectingResponseStatus:(int)expectedStatus
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    void (^handler) (NSURLResponse *, NSData *, NSError *);
    handler = ^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            onFailure(@"ASYNC_REQUEST_ERROR");
            return;
        }
        
        if (expectedStatus != 0) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode != expectedStatus) {
                onFailure(@"UNEXPECTED_HTTP_RESPONSE_STATUS");
                return;
            }
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [self.jsonDeserializer getDictionaryFromJSONData:data error:&jsonError];
        if (jsonError) {
            onFailure(@"JSON_ERROR");
            return;
        }
        
        onSucceed(json);
    };
    
    [self.asyncRequestSender sendAsynchronousRequest:request queue:self.queue completionHandler:handler];
}

@end
