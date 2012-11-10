//
//  JSONDeserializer.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-10.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSONDeserializer <NSObject>

- (id)getDictionaryFromJSONData:(NSData *)data error:(NSError **)error;

@end
