//
//  NSURLHttpClient.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-06.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPClient.h"
#import "JSONDeserializer.h"

@interface NSURLHTTPClient : NSObject <HTTPClient>

@property (nonatomic, strong) id<JSONDeserializer> jsonDeserializer;

@end
