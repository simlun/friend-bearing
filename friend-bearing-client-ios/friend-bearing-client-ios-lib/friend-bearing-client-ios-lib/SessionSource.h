//
//  SessionSource.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Session.h"

@protocol SessionSource <NSObject>

@property (nonatomic, readonly, strong) Session* currentSession;

@end
