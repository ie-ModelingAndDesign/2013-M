//
//  VsViewController.m
//  RPS3
//
//  Created by e125719 on 2014/01/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "VsViewController.h"
#import "SessionHelper.h"

@interface VsViewController ()

@end

@implementation VsViewController

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
    
    // ラベルに何も表示しない
    self.label_enemy.text = @"";
    self.label_result.text = @"";
    
    // "もう一度"ボタンを隠す
    self.button_again.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setSession:(SessionHelper *)helper
{
    _helper = helper;
}

// プレイヤーが"グー"ボタンを選択した場合
- (IBAction)rock_push:(id)sender {
    [_helper sendData:@"rock"];
    
    self.button_scissors.hidden = YES;
    self.button_paper.hidden = YES;
}

// プレイヤーが"チョキ"ボタンを選択した場合
- (IBAction)scissors_push:(id)sender {
    [_helper sendData:@"scissors"];
    
    self.button_rock.hidden = YES;
    self.button_paper.hidden = YES;
}

// プレイヤーが"パー"ボタンを選択した場合
- (IBAction)paper_push:(id)sender {
    [_helper sendData:@"paper"];
    
    self.button_rock.hidden = YES;
    self.button_scissors.hidden = YES;
}

- (IBAction)again_push:(id)sender {
    self.label_msg.text = @"じゃんけん・・・";
    
    // "グー", "チョキ", "パー"ボタンを表示
    self.button_rock.hidden = NO;
    self.button_scissors.hidden = NO;
    self.button_paper.hidden = NO;
    
    self.button_again.hidden = YES;  // "もう一度"ボタンを隠す
    
    // "グー", "チョキ", "パー"ボタンを使用可に
    self.button_rock.enabled = YES;
    self.button_scissors.enabled = YES;
    self.button_paper.enabled = YES;
    
    // ラベルに何も表示しない
    self.label_enemy.text = @"";
    self.label_result.text = @"";
}

@end
