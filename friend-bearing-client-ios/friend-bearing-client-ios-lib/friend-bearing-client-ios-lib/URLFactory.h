//
//  URLFactory.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-11-15.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol URLFactory <NSObject>

- (NSString *)createURLForGettingFriendBearingFor:(NSString *)friendID;

@end
