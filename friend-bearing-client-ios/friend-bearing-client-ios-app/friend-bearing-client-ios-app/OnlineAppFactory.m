//
//  OnlineAppFactory.m
//  friend-bearing-client-ios-app
//
//  Created by simlun on 2012-12-02.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "OnlineAppFactory.h"

#import "WebServiceSessionSource.h"
#import "NSURLHTTPClient.h"
#import "NSURLConnectionAsyncURLRequestSender.h"
#import "NSJSONSerializationJSONDeserializer.h"

#import "WebServiceFriendBearingSource.h"
#import "IntegrationTestURLFactory.h"

#import "CoreLocationDeviceHeadingSupplier.h"


@implementation OnlineAppFactory


#pragma mark - Private factory methods

- (id<HTTPClient>)createHTTPClient
{
    NSURLConnectionAsyncURLRequestSender *asyncURLRequestSender = [NSURLConnectionAsyncURLRequestSender new];
    asyncURLRequestSender.queue = [NSOperationQueue new];
    
    NSURLHTTPClient *httpClient = [NSURLHTTPClient new];
    httpClient.urlRequestSender = asyncURLRequestSender;
    httpClient.jsonDeserializer = [NSJSONSerializationJSONDeserializer new];
    return httpClient;
}

- (id<SessionSource>)createSessionSource
{
    WebServiceSessionSource *ws = [WebServiceSessionSource new];
    ws.httpClient = [self createHTTPClient];
    ws.urlFactory = [IntegrationTestURLFactory new];
    return ws;
}

- (id<FriendBearingSource>)createFriendBearingSource
{
    WebServiceFriendBearingSource *ws = [WebServiceFriendBearingSource new];
    ws.httpClient = [self createHTTPClient];
    ws.urlFactory = [IntegrationTestURLFactory new];
    return ws;
}

- (id<DeviceHeadingSupplier>)createDeviceHeadingSupplier
{
    return [CoreLocationDeviceHeadingSupplier new];
}

- (FriendLocatorPresenterFactory *)createFriendLocatorPresenterFactory
{
    FriendLocatorPresenterFactory *factory = [FriendLocatorPresenterFactory new];
    factory.friendBearingSource = [self createFriendBearingSource];
    factory.deviceHeadingSupplier = [self createDeviceHeadingSupplier];
    return factory;
}


#pragma mark - AppFactory implementation

- (ChooseFriendPresenter *)buildChooseFriendPresenter
{
    ChooseFriendPresenter *p = [ChooseFriendPresenter new];
    p.friendLocatorPresenterFactory = [self createFriendLocatorPresenterFactory];
    p.sessionSource = [self createSessionSource];
    return p;
}

@end
