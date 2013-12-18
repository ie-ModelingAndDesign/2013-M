//
//  ComViewController.m
//  RPS2
//
//  Created by e125719 on 2013/12/18.
//  Copyright (c) 2013年 e125719. All rights reserved.
//

#import "ComViewController.h"

@interface ComViewController ()

@end

@implementation ComViewController

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
    self.label_enemy.text = @"";
    self.label_result.text = @"";
    
    self.button_again.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rock_push:(id)sender {
    self.label_msg.text = @"ぽん!";
    
    self.button_scissors.hidden = YES;
    self.button_paper.hidden = YES;
    
    srand(time(nil));
    NSInteger janken;
    janken = rand() % 3;
    
    if (janken == 0) {
        self.label_enemy.text = @"グー";
        self.label_result.text = @"あいこで・・・";
        
        self.button_scissors.hidden = NO;
        self.button_paper.hidden = NO;
    } else if (janken == 1) {
        self.label_enemy.text = @"チョキ";
        self.label_result.text = @"あなたの勝ち";
        
        self.button_rock.enabled = NO;
        self.button_again.hidden = NO;
    } else if (janken == 2) {
        self.label_enemy.text = @"パー";
        self.label_result.text = @"あなたの負け";
        
        self.button_rock.enabled = NO;
        self.button_again.hidden = NO;
    }
}

- (IBAction)scissors_push:(id)sender {
    self.label_msg.text = @"ぽん!";
    
    self.button_rock.hidden = YES;
    self.button_paper.hidden = YES;
    
    srand(time(nil));
    NSInteger janken;
    janken = rand() % 3;
    
    if (janken == 0) {
        self.label_enemy.text = @"グー";
        self.label_result.text = @"あなたの負け";
        
        self.button_scissors.enabled = NO;
        self.button_again.hidden = NO;
    } else if (janken == 1) {
        self.label_enemy.text = @"チョキ";
        self.label_result.text = @"あいこで・・・";
        
        self.button_rock.hidden = NO;
        self.button_paper.hidden = NO;
    } else if (janken == 2) {
        self.label_enemy.text = @"パー";
        self.label_result.text = @"あなたの勝ち";
        
        self.button_scissors.enabled = NO;
        self.button_again.hidden = NO;
    }
}

- (IBAction)paper_push:(id)sender {
    self.label_msg.text = @"ぽん!";
    
    self.button_rock.hidden = YES;
    self.button_scissors.hidden = YES;
    
    srand(time(nil));
    NSInteger janken;
    janken = rand() % 3;
    
    if (janken == 0) {
        self.label_enemy.text = @"グー";
        self.label_result.text = @"あなたの勝ち";
        
        self.button_paper.enabled = NO;
        self.button_again.hidden = NO;
    } else if (janken == 1) {
        self.label_enemy.text = @"チョキ";
        self.label_result.text = @"あなたの負け";
        
        self.button_paper.enabled = NO;
        self.button_again.hidden = NO;
    } else if (janken == 2) {
        self.label_enemy.text = @"パー";
        self.label_result.text = @"あいこで・・・";
        
        self.button_rock.hidden = NO;
        self.button_scissors.hidden = NO;
    }
}

- (IBAction)again_push:(id)sender {
    self.label_msg.text = @"じゃんけん・・・";
    
    self.button_rock.hidden = NO;
    self.button_scissors.hidden = NO;
    self.button_paper.hidden = NO;
    self.button_again.hidden = YES;
    
    self.button_rock.enabled = YES;
    self.button_scissors.enabled = YES;
    self.button_paper.enabled = YES;
    
    self.label_enemy.text = @"";
    self.label_result.text = @"";
}
@end
