//
//  StubbedAsyncRequestSender.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "StubbedAsyncRequestSender.h"

@implementation StubbedAsyncRequestSender

- (void)sendAsynchronousRequest:(NSURLRequest *)request
                          queue:(NSOperationQueue*)queue
              completionHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler
{
    handler(nil, nil, nil);
}

@end
