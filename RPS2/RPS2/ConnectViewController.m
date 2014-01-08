//
//  ConnectViewController.m
//  RPS2
//
//  Created by e125719 on 2014/01/08.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "ConnectViewController.h"
#import "PeerListViewController.h"

static NSString * const SegueIdentifierPushPeerListView = @"PushPeerListViewSegue";

@interface ConnectViewController ()

@property (weak, nonatomic) IBOutlet UITextField *displayNameTextField;

- (IBAction)createSessionButtonDidTouch:(id)sender;

@end

@implementation ConnectViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:SegueIdentifierPushPeerListView]) {
        PeerListViewController *viewController = segue.destinationViewController;
        [viewController createSessionWithDisplayName:self.displayNameTextField.text];
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
