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
        NSURL *url = [NSURL URLWithString:@"http://localhost:3000/session"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        request.HTTPMethod = @"POST";
        
        NSLog(@"Contacting web service...");
        [self.asyncRequestSender sendAsynchronousRequest:request
                                                   queue:self.queue
                                       completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                                           NSLog(@">>> Response: %@", response);
                                           NSLog(@">>> Data: %@", data);
                                           NSLog(@">>> Error: %@", error);
                                           Session *s = [Session new];

                                           // TODO: Verify the NSError instance

                                           // TODO: Verify the NSURLResponse instance
                                           NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                           int httpStatus = httpResponse.statusCode;
                                           NSLog(@">>> HTTP Status Code: %i", httpStatus);

                                           NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                           NSLog(@">>> JSON string: %@", jsonString);

                                           NSError *jsonError = nil;
                                           NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];

                                           NSLog(@">>> JSON error instance: %@", jsonError);
                                           NSLog(@">>> JSON instance: %@", json);
                                           NSLog(@">>> JSON response user-id: %@", [json valueForKey:@"user-id"]);

                                           s.userID = [json valueForKey:@"user-id"];

                                           succeed(s);
        }];
    }
}

@end
