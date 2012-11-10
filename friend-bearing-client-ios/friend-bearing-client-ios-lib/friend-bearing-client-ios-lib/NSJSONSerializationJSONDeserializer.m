//
//  NSJSONSerializationJSONDeserializer.m
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "NSJSONSerializationJSONDeserializer.h"

@implementation NSJSONSerializationJSONDeserializer

- (id)getDictionaryFromJSONData:(NSData *)data error:(NSError **)error
{
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
}

@end
