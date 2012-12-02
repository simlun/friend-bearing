//
//  ChooseFriendViewController.m
//  friend-bearing-client-ios-app
//
//  Created by Simon Lundmark on 2012-06-12.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "ChooseFriendViewController.h"
#import "FriendLocatorDisplay.h"

#import "OfflineAppFactory.h"
#import "OnlineAppFactory.h"


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
    self.presenter = [[OfflineAppFactory new] buildChooseFriendPresenter];
    //self.presenter = [[OnlineAppFactory new] buildChooseFriendPresenter];
    
    self.presenter.display = self;
    
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
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"ChooseFriendViewController.setUserID, on main queue");
        self.userIDLabel.text = userID;
    });
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

- (void)setFriendLocatorDisplayDependencies:(id<FriendLocatorDisplay>)display
{
    display.presenter = self.presenter.friendLocatorPresenter;
    display.presenter.display = display;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"ChooseFriendViewController.prepareForSegue");
    if ([segue.identifier isEqualToString:@"goToFriendLocator"]) {
        id<FriendLocatorDisplay> friendLocatorDisplay = segue.destinationViewController;
        [self setFriendLocatorDisplayDependencies:friendLocatorDisplay];
    }
}

@end
