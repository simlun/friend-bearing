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
        // TODO: Do not hard code the URL
        NSString *urlString = @"http://localhost:3000/session";
        
        OnSuccessBlock_t onSuccess = ^(NSDictionary *json) {
            Session *s = [Session new];
            s.userID = [json valueForKey:@"user-id"];
            // TODO: Verify that the json dictionary really contained a user-id
            succeed(s);
        };
        
        OnFailureBlock_t onFailure = ^(NSString *message) {
            fail(message);
        };

        // TODO: Pass in a real expected response status
        [self.httpClient doPostRequestWithURL:urlString andSucceed:onSuccess orFail:onFailure expectingResponseStatus:201];
    }
}

@end
