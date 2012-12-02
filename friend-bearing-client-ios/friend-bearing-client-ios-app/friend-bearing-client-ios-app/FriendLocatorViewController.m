//
//  FriendLocatorViewController.m
//  friend-bearing-client-ios-app
//
//  Created by Simon Lundmark on 2012-06-13.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FriendLocatorViewController.h"

// Circular dependency
// http://stackoverflow.com/a/5425502
#import "FriendLocatorPresenter.h"

@implementation FriendLocatorViewController

@synthesize presenter = _presenter;

@synthesize deviceIsPointingAtFriend = _deviceIsPointingAtFriend;
- (void)setDeviceIsPointingAtFriend:(BOOL)deviceIsPointingAtFriend
{
    NSLog(@"FriendLocatorViewController.setDeviceIsPointingAtFriend");
    
    NSString *text = @"No";
    if (deviceIsPointingAtFriend) {
        text = @"Yes";
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"FriendLocatorViewController.setDeviceIsPointingAtFriend: %@", text);
        self.isDevicePointingAtFriendLabel.text = text;
    });
    
    _deviceIsPointingAtFriend = deviceIsPointingAtFriend;
}

@synthesize isFriendBearingLoaded = _isFriendBearingLoaded;
- (void)setIsFriendBearingLoaded:(BOOL)isFriendBearingLoaded
{
    NSLog(@"FriendLocatorViewController.setIsFriendBearingLoaded");
    
    NSString *text = @"No";
    if (isFriendBearingLoaded) {
        text = @"Yes";
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"FriendLocatorViewController.setIsFriendBearingLoaded: %@", text);
        self.isFriendBearingLoadedLabel.text = text;
    });
    
    _isFriendBearingLoaded = isFriendBearingLoaded;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"FriendLocatorViewController.initWithNibName");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setInitialState
{
    self.isFriendBearingLoaded = self.isFriendBearingLoaded;
    self.deviceIsPointingAtFriend = self.deviceIsPointingAtFriend;
}

- (void)viewDidLoad
{
    NSLog(@"FriendLocatorViewController.viewDidLoad");
    NSLog(@"FriendLocatorViewController, Presenter: %@", self.presenter);
    NSLog(@"FriendLocatorViewController, Presenter.friendID: %@", self.presenter.friendID);
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setInitialState];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"FriendLocatorViewController.viewDidAppear");
    NSLog(@"FriendLocatorViewController, Presenter: %@", self.presenter);
    NSLog(@"FriendLocatorViewController, Presenter.friendID: %@", self.presenter.friendID);
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"FriendLocatorViewController.viewDidDisappear");
}

- (void)viewDidUnload
{
    [self setIsDevicePointingAtFriendLabel:nil];
    [self setIsFriendBearingLoadedLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
