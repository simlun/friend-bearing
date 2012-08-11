//
//  CompassTest.m
//  friend-bearing-client-ios-lib
//
//  Created by Simon Lundmark on 2012-07-09.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "CompassTest.h"
#import "Compass.h"

@implementation CompassTest
- (void)test_itIsNot_pointingAtFriend_whenDeviceIsPointed_awayFromFriend
{
    Compass *c = [Compass new];
    
    c.friendHeading = 45.0;
    c.deviceHeading = 0.0;
    
    STAssertFalse(c.isPointingAtFriend, nil);
}

- (void)test_itIs_pointingAtFriend_whenDeviceIsPointed_directlyAtAFriend
{
    Compass *c = [Compass new];
    
    c.friendHeading = 45.0;
    c.deviceHeading = 45.0;
    
    STAssertTrue(c.isPointingAtFriend, nil);
}

- (void)test_thePointing_canSwitchBackAndForth
{
    Compass *c = [Compass new];
    c.friendHeading = 45.0;
    
    c.deviceHeading = 45.0;
    STAssertTrue(c.isPointingAtFriend, nil);
    
    c.deviceHeading = 0.0;
    STAssertFalse(c.isPointingAtFriend, nil);
    
    c.deviceHeading = 45.0;
    STAssertTrue(c.isPointingAtFriend, nil);
}

- (void)test_itIs_pointingAtFriend_whenDeviceIsPointed_almostAtAFriend
{
    Compass *c = [Compass new];
    c.friendHeading = 20.0;
    
    c.deviceHeading = 10.0;
    STAssertTrue(c.isPointingAtFriend, nil);
    
    c.deviceHeading = 30.0;
    STAssertTrue(c.isPointingAtFriend, nil);
}

- (void)test_itCanHandle_theFourthQuadrant
{
    Compass *c = [Compass new];
    
    c.friendHeading = 0.0;
    c.deviceHeading = 355.0;
    STAssertTrue(c.isPointingAtFriend, nil);
    
    c.friendHeading = 355.0;
    c.deviceHeading = 0.0;
    STAssertTrue(c.isPointingAtFriend, nil);
    
    c.friendHeading = 350.0;
    c.deviceHeading = 0.0;
    STAssertFalse(c.isPointingAtFriend, nil);
    
    c.friendHeading = 350.1;
    c.deviceHeading = 0.0;
    STAssertTrue(c.isPointingAtFriend, nil);
    
    c.friendHeading = 359.0;
    c.deviceHeading = 355.0;
    STAssertTrue(c.isPointingAtFriend, nil);
    
    c.friendHeading = 355.0;
    c.deviceHeading = 359.0;
    STAssertTrue(c.isPointingAtFriend, nil);
}

- (void)test_itIsNot_pointingAtFriend_whenDeviceIsPointed_almostAlmostAtAFriend
{
    Compass *c = [Compass new];
    c.friendHeading = 20.0;
    
    c.deviceHeading = 9.9;
    STAssertFalse(c.isPointingAtFriend, nil);
    
    c.deviceHeading = 30.1;
    STAssertFalse(c.isPointingAtFriend, nil);
}

@end
