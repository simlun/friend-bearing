//
//  URLRequestSender.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol URLRequestSender <NSObject>

- (void)sendRequest:(NSURLRequest *)request withCompletionHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler;

@end
