//
//  ChooseFriendPresenterFactory.m
//  friend-bearing-client-ios-app
//
//  Created by simlun on 2012-10-05.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "ChooseFriendPresenterFactory.h"
#import "FakeSleepingAsyncSessionSource.h"
#import "FakeSleepingAsyncFriendBearingSource.h"

//#import "WebServiceSessionSource.h"
//#import "NSURLHTTPClient.h"
//#import "NSURLConnectionAsyncRequestSender.h"
//#import "NSJSONSerializationJSONDeserializer.h"

//#import "WebServiceFriendBearingSource.h"
//#import "IntegrationTestURLFactory.h"


@implementation ChooseFriendPresenterFactory

/*+ (id<HTTPClient>)createHTTPClient
{
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.queue = [NSOperationQueue new];
    httpClient.asyncRequestSender = [NSURLConnectionAsyncRequestSender new];
    httpClient.jsonDeserializer = [NSJSONSerializationJSONDeserializer new];
    return httpClient;
}*/

+ (id<SessionSource>)createSessionSource
{
    return [FakeSleepingAsyncSessionSource new];
    
    /*WebServiceSessionSource *ws = [WebServiceSessionSource new];
    ws.httpClient = [self createHTTPClient];
    ws.urlFactory = [IntegrationTestURLFactory new];
    return ws;*/
}

+ (id<FriendBearingSource>)createFriendBearingSource
{
    return [FakeSleepingAsyncFriendBearingSource new];
    
    /*WebServiceFriendBearingSource *ws = [WebServiceFriendBearingSource new];
    ws.httpClient = [self createHTTPClient];
    ws.urlFactory = [IntegrationTestURLFactory new];
    return ws;*/
}

+ (FriendLocatorPresenterFactory *)createFriendLocatorPresenterFactory
{
    FriendLocatorPresenterFactory *factory = [FriendLocatorPresenterFactory new];
    factory.friendBearingSource = [ChooseFriendPresenterFactory createFriendBearingSource];
    return factory;
}

+ (ChooseFriendPresenter *)build
{
    ChooseFriendPresenter *p = [ChooseFriendPresenter new];
    p.friendLocatorPresenterFactory = [ChooseFriendPresenterFactory createFriendLocatorPresenterFactory];
    p.sessionSource = [ChooseFriendPresenterFactory createSessionSource];
    return p;
}

@end
