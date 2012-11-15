//
//  StubbedAsyncRequestSender.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "StubbedAsyncRequestSender.h"

@implementation StubbedAsyncRequestSender

+ (id<AsyncRequestSender>)createAsyncRequestSenderFailingWithStatusCode500
{
    StubbedAsyncRequestSender *requestSender = [StubbedAsyncRequestSender new];
    NSHTTPURLResponse *urlResponse = [[NSHTTPURLResponse alloc] initWithURL:nil statusCode:500 HTTPVersion:nil headerFields:nil];
    requestSender.urlResponse = urlResponse;
    return requestSender;
}

- (void)sendAsynchronousRequest:(NSURLRequest *)request
                          queue:(NSOperationQueue*)queue
              completionHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler
{
    handler(self.urlResponse, self.data, self.error);
}

@end
