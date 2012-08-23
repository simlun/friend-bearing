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

// TODO: Implement displaying these Display properties
@synthesize deviceIsPointingAtFriend;
@synthesize isFriendHeadingLoaded = _isFriendHeadingLoaded;
- (void)setIsFriendHeadingLoaded:(BOOL)isFriendHeadingLoaded
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:!isFriendHeadingLoaded];
    _isFriendHeadingLoaded = isFriendHeadingLoaded;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setInitialState
{
    self.isFriendHeadingLoaded = self.isFriendHeadingLoaded;
}

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    NSLog(@"Presenter: %@", self.presenter);
    NSLog(@"Presenter.friendID: %@", self.presenter.friendID);
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setInitialState];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
    NSLog(@"Presenter: %@", self.presenter);
    NSLog(@"Presenter.friendID: %@", self.presenter.friendID);
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
