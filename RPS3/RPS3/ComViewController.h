//
//  ComViewController.h
//  RPS3
//
//  Created by e125719 on 2014/01/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label_msg;
@property (weak, nonatomic) IBOutlet UILabel *label_enemy;
@property (weak, nonatomic) IBOutlet UILabel *label_result;

@property (weak, nonatomic) IBOutlet UIButton *button_rock;
@property (weak, nonatomic) IBOutlet UIButton *button_scissors;
@property (weak, nonatomic) IBOutlet UIButton *button_paper;
@property (weak, nonatomic) IBOutlet UIButton *button_again;

- (IBAction)rock_push:(id)sender;
- (IBAction)scissors_push:(id)sender;
- (IBAction)paper_push:(id)sender;
- (IBAction)again_push:(id)sender;

@end
