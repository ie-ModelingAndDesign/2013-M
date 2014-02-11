//
//  PlayerInfoViewController.m
//  RPS3
//
//  Created by e125719 on 2014/01/15.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "PlayerInfoViewController.h"
#import "PeerListViewController.h"

static NSString * const SegueIdentifierPushPeerListView = @"PushPeerListViewSegue";

@interface PlayerInfoViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *displayNameTextField;

- (IBAction)createSessionButtonDidTouch:(id)sender;

@end

@implementation PlayerInfoViewController

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"kime.png"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:SegueIdentifierPushPeerListView]) {
        PeerListViewController *playerInfoViewController = segue.destinationViewController;
        [playerInfoViewController createSessionWithDisplayName:self.displayNameTextField.text];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)createSessionButtonDidTouch:(id)sender
{
    if (self.displayNameTextField.text.length == 0) {
        return;
    }
    
    [self performSegueWithIdentifier:SegueIdentifierPushPeerListView sender:self];
}

@end
