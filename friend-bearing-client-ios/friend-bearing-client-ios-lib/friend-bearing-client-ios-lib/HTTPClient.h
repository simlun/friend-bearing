//
//  HttpClient.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-06.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncRequestSender.h"

@protocol HTTPClient <NSObject>

#pragma mark - Dependencies

@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) id<AsyncRequestSender> asyncRequestSender;


#pragma mark -

typedef void (^OnSuccessBlock_t)(NSDictionary *);
typedef void (^OnFailureBlock_t)(NSString *);

- (void)doPostRequestWithURL:(NSString *)urlString andSucceed:(OnSuccessBlock_t)onSucceed orFail:(OnFailureBlock_t)onFailure expectingResponseStatus:(int)expectedStatus;

@end