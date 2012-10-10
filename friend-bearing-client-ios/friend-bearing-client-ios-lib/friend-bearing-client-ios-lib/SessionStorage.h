//
//  SessionStorage.h
//  friend-bearing-client-ios-lib
//
//  Created by simlun on 2012-10-05.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Session.h"

@protocol SessionStorage <NSObject>

@property (nonatomic, strong) Session *session;

@end
