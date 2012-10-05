//
//  ChooseFriendPresenterFactory.h
//  friend-bearing-client-ios-app
//
//  Created by simlun on 2012-10-05.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChooseFriendPresenter.h"

@interface ChooseFriendPresenterFactory : NSObject

+ (ChooseFriendPresenter *)build;

@end
