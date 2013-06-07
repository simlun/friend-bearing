//
//  HttpClient.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-06.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HTTPClient <NSObject>

typedef void (^OnSuccessBlock_t)(NSDictionary *response);
typedef void (^OnFailureBlock_t)(NSString *errorMessage);

- (void)doGetRequestWithURL:(NSString *)urlString
                 andSucceed:(OnSuccessBlock_t)onSucceed
                     orFail:(OnFailureBlock_t)onFailure
    expectingResponseStatus:(int)expectedStatus;

- (void)doPostRequestWithURL:(NSString *)urlString
                  andSucceed:(OnSuccessBlock_t)onSucceed
                      orFail:(OnFailureBlock_t)onFailure
     expectingResponseStatus:(int)expectedStatus;

@end
