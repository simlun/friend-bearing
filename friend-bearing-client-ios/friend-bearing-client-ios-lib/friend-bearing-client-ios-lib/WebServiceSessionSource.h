//
//  WebServiceSessionSource.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-05.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionSource.h"
#import "SessionStorage.h"
#import "HTTPClient.h"

@interface WebServiceSessionSource : NSObject <SessionSource>

#pragma mark - Dependencies

@property (nonatomic, strong) id<SessionStorage> sessionStorage;
@property (nonatomic, strong) id<HTTPClient> httpClient;

@end
