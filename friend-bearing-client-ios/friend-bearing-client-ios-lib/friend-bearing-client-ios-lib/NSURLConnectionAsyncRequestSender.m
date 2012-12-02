//
//  NSURLConnectionAsyncRequestSender.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "NSURLConnectionAsyncRequestSender.h"

@implementation NSURLConnectionAsyncRequestSender

- (void)sendAsynchronousRequest:(NSURLRequest *)request
                          queue:(NSOperationQueue*)queue
              completionHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler
{
    NSLog(@"NSURLConnectionAsyncRequestSender.sendAsynchronousRequest");
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:handler];
}

@end
