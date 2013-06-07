//
//  StubbedURLRequestSender.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLRequestSender.h"

@interface StubbedURLRequestSender : NSObject <URLRequestSender>

@property (nonatomic, strong) NSURLResponse* urlResponse;
@property (nonatomic, strong) NSData* data;
@property (nonatomic, strong) NSError* error;

+ (id<URLRequestSender>)createURLRequestSenderFailingWithStatusCode500;

@end
