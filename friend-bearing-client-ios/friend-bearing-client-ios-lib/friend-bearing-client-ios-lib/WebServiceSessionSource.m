//
//  WebServiceSessionSource.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-05.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "WebServiceSessionSource.h"

@implementation WebServiceSessionSource

// TODO: Make this synchronous or thread safe. Perhaps by wrappng the call in something that's making it synchronous.
//       Perhaps that could include retrying? Is that a singleton (synchronous?) job queue?
//
//       SynchronousWebServiceSessionSource that runs NSInvocationOperations on a NSOperationQueue with number
//       of concurrent operations limited to 1?

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
