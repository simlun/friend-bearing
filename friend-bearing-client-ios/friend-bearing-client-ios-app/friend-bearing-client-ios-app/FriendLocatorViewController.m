//
//  FriendLocatorViewController.m
//  friend-bearing-client-ios-app
//
//  Created by Simon Lundmark on 2012-06-13.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "FriendLocatorViewController.h"

@implementation FriendLocatorViewController

@synthesize friendIDLabel = _friendIDLabel;
@synthesize presenter = _presenter;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    NSLog(@"Presenter: %@", self.presenter);
    NSLog(@"Presenter.friendID: %@", self.presenter.friendID);
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setFriendIDLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    self.friendIDLabel.text = self.presenter.friendID;
}

@end
