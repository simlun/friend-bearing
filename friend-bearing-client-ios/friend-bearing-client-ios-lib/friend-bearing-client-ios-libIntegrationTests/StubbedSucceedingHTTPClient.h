//
//  StubbedSucceedingHTTPClient.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPClient.h"

@interface StubbedSucceedingHTTPClient : NSObject <HTTPClient>

@property (nonatomic, strong) NSDictionary *stubbedResponse;

@end
