//
//  WebServiceFriendBearingSource.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-11.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "WebServiceFriendBearingSource.h"

@implementation WebServiceFriendBearingSource

- (void)getBearingOf:(NSString*)friendID andSucceed:(SuccessfulFriendBearingSourceBlock_t)succeed orFail:(FailedFriendBearingSourceBlock_t)fail
{
    NSString *urlString = [self.urlFactory createURLForGettingFriendBearingFor:friendID];
    
    OnSuccessBlock_t onSuccess = ^(NSDictionary *response) {
        NSNumber *bearingObject = [response valueForKey:@"magnetic-bearing"];
        if (bearingObject == nil) {
            fail(@"INCOMPLETE_WEB_SERVICE_RESPONSE");
            return;
        }
        
        double bearing = [bearingObject doubleValue];
        succeed(bearing);
    };
    
    OnFailureBlock_t onFailure = ^(NSString *errorMessage) {
        fail(errorMessage);
    };
    
    int expectedStatus = 200;
    
    [self.httpClient doGetRequestWithURL:urlString
                              andSucceed:onSuccess
                                  orFail:onFailure
                 expectingResponseStatus:expectedStatus];
}

@end
