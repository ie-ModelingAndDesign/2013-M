//
//  COMViewController.h
//  RPS
//
//  Created by e125719 on 2013/12/05.
//  Copyright (c) 2013年 e125719. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COMViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label_msg;
@property (weak, nonatomic) IBOutlet UILabel *label_ememy;
@property (weak, nonatomic) IBOutlet UILabel *label_result;

@property (weak, nonatomic) IBOutlet UIButton *button_rock;
@property (weak, nonatomic) IBOutlet UIButton *button_scissors;
@property (weak, nonatomic) IBOutlet UIButton *button_paper;
@property (weak, nonatomic) IBOutlet UIButton *button_again;

- (IBAction)push_rock:(id)sender;
- (IBAction)push_scissors:(id)sender;
- (IBAction)push_paper:(id)sender;
- (IBAction)push_again:(id)sender;
@end
