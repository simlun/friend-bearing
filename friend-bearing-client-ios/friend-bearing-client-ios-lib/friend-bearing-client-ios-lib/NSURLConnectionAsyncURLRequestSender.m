//
//  NSURLConnectionAsyncURLRequestSender.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "NSURLConnectionAsyncURLRequestSender.h"

@implementation NSURLConnectionAsyncURLRequestSender

@synthesize queue = _queue;

- (void)sendRequest:(NSURLRequest *)request withCompletionHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler
{
    NSLog(@"NSURLConnectionAsyncURLRequestSender.sendRequest:withCompletionHandler:");
    [NSURLConnection sendAsynchronousRequest:request queue:self.queue completionHandler:handler];
}

@end
