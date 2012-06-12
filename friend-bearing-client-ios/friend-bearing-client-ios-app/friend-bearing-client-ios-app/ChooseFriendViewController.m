//
//  ChooseFriendViewController.m
//  friend-bearing-client-ios-app
//
//  Created by Simon Lundmark on 2012-06-12.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import "ChooseFriendViewController.h"
#import "ChooseFriendPresenter.h"

@interface ChooseFriendViewController()
@property (nonatomic, strong) ChooseFriendPresenter* presenter;
@end

@implementation ChooseFriendViewController

@synthesize presenter = _presenter;
@synthesize userIDLabel = _userIDLabel;

- (void)bindPresenter
{
    self.presenter = [ChooseFriendPresenter new];
    self.presenter.display = self;
    
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


#pragma mark - Display implementation

- (NSString*)userID
{
    return self.userIDLabel.text;
}
- (void)setUserID:(NSString *)userID
{
    NSLog(@"setUserID was called with userID %@", userID);
    self.userIDLabel.text = userID;
}

- (void)showFriendLocatorDisplay
{
    NSLog(@"showFriendLocatorDisplay called");
}


@end
