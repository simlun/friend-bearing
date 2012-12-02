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

// TODO: Implement displaying this Display property
@synthesize deviceIsPointingAtFriend;

// TODO: Implement displaying this Display property
@synthesize isFriendBearingLoaded = _isFriendBearingLoaded;
- (void)setIsFriendBearingLoaded:(BOOL)isFriendBearingLoaded
{
    // TODO: [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:!isFriendBearingLoaded];
    
    if (isFriendBearingLoaded) {
        NSLog(@"FriendLocatorViewController.setIsFriendBearingLoaded: YES");
        self.isFriendBearingLoadedLabel.text = @"Yes";
    } else {
        NSLog(@"FriendLocatorViewController.setIsFriendBearingLoaded: NO");
        self.isFriendBearingLoadedLabel.text = @"No";
    }
    
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
    //self.isFriendBearingLoaded = NO;
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
    // TODO: [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)viewDidUnload
{
    [self setIsDevicePointingAtFriendLabel:nil];
    [self setIsFriendBearingLoadedLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
