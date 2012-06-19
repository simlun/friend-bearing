//
//  ChooseFriendViewController.h
//  friend-bearing-client-ios-app
//
//  Created by Simon Lundmark on 2012-06-12.
//  Copyright (c) 2012 Simon Lundmark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseFriendDisplay.h"

@interface ChooseFriendViewController : UIViewController <ChooseFriendDisplay>

@property (weak, nonatomic) IBOutlet UILabel *userIDLabel;
@property (weak, nonatomic) IBOutlet UITextField *friendIDField;

@end
