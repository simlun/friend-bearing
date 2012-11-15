//
//  WebServiceFriendBearingSource.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-11.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendBearingSource.h"
#import "HTTPClient.h"
#import "URLFactory.h"

@interface WebServiceFriendBearingSource : NSObject <FriendBearingSource>

#pragma mark - Dependencies

@property (nonatomic, strong) id<HTTPClient> httpClient;
@property (nonatomic, strong) id<URLFactory> urlFactory;


@end
