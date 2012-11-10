//
//  ChooseFriendPresenterFactory.m
//  friend-bearing-client-ios-app
//
//  Created by simlun on 2012-10-05.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "ChooseFriendPresenterFactory.h"
#import "FakeSleepingAsyncSessionSource.h"

#import "WebServiceSessionSource.h"
#import "NSURLHTTPClient.h"
#import "NSURLConnectionAsyncRequestSender.h"
#import "NSJSONSerializationJSONDeserializer.h"

@implementation ChooseFriendPresenterFactory

+ (ChooseFriendPresenter *)build
{
    ChooseFriendPresenter *p = [ChooseFriendPresenter new];
    p.friendLocatorPresenterFactory = [FriendLocatorPresenterFactory new];
    
    p.sessionSource = [FakeSleepingAsyncSessionSource new];
    
    /*WebServiceSessionSource *ws = [WebServiceSessionSource new];
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.queue = [NSOperationQueue new];
    httpClient.asyncRequestSender = [NSURLConnectionAsyncRequestSender new];
    httpClient.jsonDeserializer = [NSJSONSerializationJSONDeserializer new];
    ws.httpClient = httpClient;
    p.sessionSource = ws;*/
    
    return p;
}

@end
