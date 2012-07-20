//
//  ChooseFriendViewController.m
//  friend-bearing-client-ios-app
//
//  Created by Simon Lundmark on 2012-06-12.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "ChooseFriendViewController.h"
#import "ChooseFriendPresenter.h"
#import "FriendLocatorDisplay.h"


@interface ChooseFriendViewController()
@property (nonatomic, strong) ChooseFriendPresenter* presenter;
@end

@implementation ChooseFriendViewController

@synthesize presenter = _presenter;
@synthesize userIDLabel = _userIDLabel;
@synthesize friendIDField = _friendIDField;


#pragma mark - View Lifecycle

- (void)bindPresenter
{
    self.presenter = [ChooseFriendPresenter new];
    self.presenter.display = self;
    
    // TODO
    //self.presenter.sessionSource = ...
    
    [self.presenter updateDisplay];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self bindPresenter];
}

- (void)viewDidUnload
{
    [self setUserIDLabel:nil];
    [self setFriendIDField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


#pragma mark - Display Implementation

- (NSString*)userID
{
    return self.userIDLabel.text;
}
- (void)setUserID:(NSString *)userID
{
    NSLog(@"setUserID was called with userID %@", userID);
    self.userIDLabel.text = userID;
}

- (NSString*)friendID
{
    return self.friendIDField.text;
}
- (void)setFriendID:(NSString *)friendID 
{
    NSLog(@"setFriendID was called with friendID %@", friendID);
    self.friendIDField.text = friendID;
}

- (void)showFriendLocatorDisplay
{
    NSLog(@"showFriendLocatorDisplay called");
    [self performSegueWithIdentifier:@"goToFriendLocator" sender:self];
}


#pragma mark - UI Actions

- (IBAction)searchButtonPressed:(id)sender
{
    NSLog(@"searchButtonPressed");
    [self.presenter submitButtonPressed];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Preparing for segue");
    if ([segue.identifier isEqualToString:@"goToFriendLocator"]) {
        id<FriendLocatorDisplay> destinationDisplay = segue.destinationViewController;
        destinationDisplay.presenter = self.presenter.friendLocatorPresenter;
    }
}

@end
