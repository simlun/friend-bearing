//
//  StubbedFailingJSONDeserializer.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "StubbedFailingJSONDeserializer.h"

@implementation StubbedFailingJSONDeserializer

- (id)getDictionaryFromJSONData:(NSData *)data error:(NSError **)error
{
    *error = [NSError errorWithDomain:@"se.simlun" code:0 userInfo:nil];
    return nil;
}

@end
