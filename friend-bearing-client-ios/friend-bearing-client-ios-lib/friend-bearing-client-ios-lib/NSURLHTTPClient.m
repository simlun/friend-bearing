//
//  NSURLHttpClient.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-06.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "NSURLHTTPClient.h"

@implementation NSURLHTTPClient

@synthesize queue = _queue;
@synthesize asyncRequestSender = _asyncRequestSender;

- (void)doPostRequestWithURL:(NSString *)urlString andSucceed:(OnSuccessBlock_t)onSucceed orFail:(OnFailureBlock_t)onFailure expectingResponseStatus:(int)expectedStatus
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    [self.asyncRequestSender sendAsynchronousRequest:request
                                               queue:self.queue
                                   completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                                       if (error) {
                                           onFailure(@"ASYNC_REQUEST_NSERROR");
                                           return;
                                       }
                                       
                                       NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                       if (httpResponse.statusCode != expectedStatus) {
                                           onFailure(@"UNEXPECTED_HTTP_RESPONSE_STATUS");
                                           return;
                                       }
                                       
                                       NSError *jsonError = nil;
                                       NSDictionary *json = [NSDictionary dictionary];
                                       json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                                       // TODO: Verify possible jsonError
                                       
                                       onSucceed(json);
                                   }];
}

@end
