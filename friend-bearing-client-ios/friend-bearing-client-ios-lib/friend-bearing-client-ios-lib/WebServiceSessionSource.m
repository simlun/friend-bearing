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
        NSURL *url = [NSURL URLWithString:@"http://localhost:8080/session/new"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSLog(@"Contacting web service...");
        [self.asyncRequestSender sendAsynchronousRequest:request
                                                   queue:self.queue
                                       completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                                           NSLog(@">>> Response: %@", response);
                                           NSLog(@">>> Data: %@", data);
                                           NSLog(@">>> Error: %@", error);
                                           Session *s = [Session new];
                                           s.userID = @"123";
                                           succeed(s);
        }];
        
    }
}

@end
