//
//  COMViewController.m
//  RPS
//
//  Created by e125719 on 2013/12/05.
//  Copyright (c) 2013年 e125719. All rights reserved.
//

#import "COMViewController.h"

@interface COMViewController ()

@end

@implementation COMViewController
@synthesize label_ememy;
@synthesize label_msg;
@synthesize label_result;
@synthesize button_again;
@synthesize button_paper;
@synthesize button_rock;
@synthesize button_scissors;

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

- (IBAction)push_rock:(id)sender {
}

- (IBAction)push_scissors:(id)sender {
}

- (IBAction)push_paper:(id)sender {
}

- (IBAction)push_again:(id)sender {
}
@end
