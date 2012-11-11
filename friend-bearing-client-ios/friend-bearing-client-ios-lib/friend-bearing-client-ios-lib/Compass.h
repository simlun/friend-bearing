//
//  Compass.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-09.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Compass : NSObject

@property (nonatomic) double friendBearing;
@property (nonatomic) double deviceHeading;

@property (nonatomic, readonly) BOOL isPointingAtFriend;

@end
