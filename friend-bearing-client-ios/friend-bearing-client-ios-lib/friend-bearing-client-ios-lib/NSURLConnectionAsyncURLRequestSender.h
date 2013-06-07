//
//  NSURLConnectionAsyncURLRequestSender.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLRequestSender.h"

@interface NSURLConnectionAsyncURLRequestSender : NSObject <URLRequestSender>

#pragma mark - Dependencies

@property (nonatomic, strong) NSOperationQueue *queue;

@end
