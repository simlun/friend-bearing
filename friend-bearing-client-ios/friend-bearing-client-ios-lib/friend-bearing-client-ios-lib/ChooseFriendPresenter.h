//
//  ChooseFriendPresenter.h
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-05-25.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionSource.h"
#import "ChooseFriendDisplay.h"

@interface ChooseFriendPresenter : NSObject

@property (nonatomic, strong) id<ChooseFriendDisplay> display;
@property (nonatomic, strong) id<SessionSource> sessionSource;

- (void)updateDisplay;

@end
