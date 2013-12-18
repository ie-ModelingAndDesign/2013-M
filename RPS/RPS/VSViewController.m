//
//  VSViewController.m
//  RPS
//
//  Created by e125719 on 2013/12/07.
//  Copyright (c) 2013年 e125719. All rights reserved.
//

#import "VSViewController.h"

@interface VSViewController ()


@end

@implementation VSViewController
@dynamic Key;


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


- (BOOL)textFieldShouldReturn:(UITextField *)Key
{
    // キーボードを隠す
    [self.view endEditing:YES];
    
    return YES;
}



@end

