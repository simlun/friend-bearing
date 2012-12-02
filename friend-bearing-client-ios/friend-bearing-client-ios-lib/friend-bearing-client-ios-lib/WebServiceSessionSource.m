//
//  WebServiceSessionSource.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-05.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "WebServiceSessionSource.h"

@implementation WebServiceSessionSource

- (void)getCurrentSessionAndSucceed:(SuccessfulSessionSourceBlock_t)succeed orFail:(FailedSessionSourceBlock_t)fail
{
    if (self.sessionStorage.session != nil) {
        succeed(self.sessionStorage.session);
    } else {
        NSString *urlString = [self.urlFactory buildURLForCreatingANewSession];
        
        OnSuccessBlock_t onSuccess = ^(NSDictionary *response) {
            Session *s = [Session new];
            s.userID = [response valueForKey:@"user-id"];
            if (s.userID == nil) {
                fail(@"INCOMPLETE_WEB_SERVICE_RESPONSE");
                return;
            }
            NSLog(@"WebServiceSessionSource.getCurrentSessionAndSucceed, success block succeding!");
            succeed(s);
        };
        
        OnFailureBlock_t onFailure = ^(NSString *errorMessage) {
            fail(errorMessage);
        };
        
        int expectedStatus = 201;

        NSLog(@"WebServiceSessionSource.getCurrentSessionAndSucceed, now posting using httpClient");
        [self.httpClient doPostRequestWithURL:urlString andSucceed:onSuccess orFail:onFailure expectingResponseStatus:expectedStatus];
    }
}

@end
