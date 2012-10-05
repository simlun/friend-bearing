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
#import "FriendLocatorPresenterFactory.h"
#import "FakeSleepingAsyncSessionSource.h"


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
    // TODO: Break out this object graph construction to its own class!
    
    self.presenter = [ChooseFriendPresenter new];
    self.presenter.display = self;
    
    self.presenter.friendLocatorPresenterFactory = [FriendLocatorPresenterFactory new];
    
    // TODO
    self.presenter.sessionSource = [FakeSleepingAsyncSessionSource new];
    
    [self.presenter showUserID];
}

- (void)viewDidLoad
{
    NSLog(@"ChooseFriendViewController.viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self bindPresenter];
}

- (void)viewDidUnload
{
    NSLog(@"ChooseFriendViewController.viewDidUnload");
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
    NSLog(@"ChooseFriendViewController.setUserID was called with userID %@", userID);
    self.userIDLabel.text = userID;
}

- (NSString*)friendID
{
    return self.friendIDField.text;
}
- (void)setFriendID:(NSString *)friendID 
{
    NSLog(@"ChooseFriendViewController.setFriendID was called with friendID %@", friendID);
    self.friendIDField.text = friendID;
}

- (void)showFriendLocatorDisplay
{
    NSLog(@"ChooseFriendViewController.showFriendLocatorDisplay called");
    [self performSegueWithIdentifier:@"goToFriendLocator" sender:self];
}


#pragma mark - UI Actions

- (IBAction)searchButtonPressed:(id)sender
{
    NSLog(@"ChooseFriendViewController.searchButtonPressed");
    [self.presenter submitButtonPressed];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"ChooseFriendViewController.prepareForSegue");
    if ([segue.identifier isEqualToString:@"goToFriendLocator"]) {
        id<FriendLocatorDisplay> destinationDisplay = segue.destinationViewController;
        destinationDisplay.presenter = self.presenter.friendLocatorPresenter;
    }
}

@end
