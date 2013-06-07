//
//  StubbedURLRequestSender.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "StubbedURLRequestSender.h"

@implementation StubbedURLRequestSender

+ (id<URLRequestSender>)createURLRequestSenderFailingWithStatusCode500
{
    StubbedURLRequestSender *requestSender = [StubbedURLRequestSender new];
    NSHTTPURLResponse *urlResponse = [[NSHTTPURLResponse alloc] initWithURL:nil statusCode:500 HTTPVersion:nil headerFields:nil];
    requestSender.urlResponse = urlResponse;
    return requestSender;
}

- (void)sendRequest:(NSURLRequest *)request withCompletionHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler
{
    handler(self.urlResponse, self.data, self.error);
}

@end
