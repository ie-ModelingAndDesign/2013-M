//
//  VsViewController.m
//  RPS3
//
//  Created by e125719 on 2014/01/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "VsViewController.h"

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

// プレイヤーが"グー"ボタンを選択した場合
- (IBAction)rock_push:(id)sender {
    
    // メッセージラベルを表示
    self.label_msg.text = @"ぽん!";
    
    // "チョキ", "パー"ボタンを隠す
    self.button_scissors.hidden = YES;
    self.button_paper.hidden = YES;
    
    // COMのジャンケンの手を決定
    srand(time(nil));
    NSInteger janken;
    janken = rand() % 3;
    
    if (janken == 0) {
        
        // COMが"グー"を選択した場合
        self.label_enemy.text = @"グー";  // COMが"グー"を出したと表示
        self.label_result.text = @"あいこで・・・";  // じゃんけん結果を表示
        
        // "チョキ", "パー"ボタンを表示
        self.button_scissors.hidden = NO;
        self.button_paper.hidden = NO;
        
    } else if (janken == 1) {
        
        // COMが"チョキ"を選択した場合
        self.label_enemy.text = @"チョキ";  // COMが"チョキ"を出したと表示
        self.label_result.text = @"あなたの勝ち";  // ジャンケン結果を表示
        
        self.button_rock.enabled = NO;  // "グー"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示
        
    } else if (janken == 2) {
        
        // COMが"パー"を選択した場合
        self.label_enemy.text = @"パー";  // COMが"パー"を出したと表示
        self.label_result.text = @"あなたの負け";  // ジャンケン結果を表示
        
        self.button_rock.enabled = NO;  // "グー"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示
    }
}

// プレイヤーが"チョキ"ボタンを選択した場合
- (IBAction)scissors_push:(id)sender {
    
    // メッセージラベルを表示
    self.label_msg.text = @"ぽん!";
    
    // "グー", "パー"ボタンを隠す
    self.button_rock.hidden = YES;
    self.button_paper.hidden = YES;
    
    // COMのジャンケンの手を決定
    srand(time(nil));
    NSInteger janken;
    janken = rand() % 3;
    
    if (janken == 0) {
        
        // COMが"グー"を選択した場合
        self.label_enemy.text = @"グー";  // COMが"グー"を出したと表示
        self.label_result.text = @"あなたの負け";  // ジャンケン結果を表示
        
        self.button_scissors.enabled = NO;  // "チョキ"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示
        
    } else if (janken == 1) {
        
        // COMが"チョキ"を選択した場合
        self.label_enemy.text = @"チョキ";  // COMが"チョキ"を出したと表示
        self.label_result.text = @"あいこで・・・";  // ジャンケン結果を表示
        
        // "グー", "パー"ボタンを表示
        self.button_rock.hidden = NO;
        self.button_paper.hidden = NO;
        
    } else if (janken == 2) {
        
        // COMが"パー"を選択した場合
        self.label_enemy.text = @"パー";  // COMが"パー"を出したと表示
        self.label_result.text = @"あなたの勝ち";  // ジャンケン結果を表示
        
        self.button_scissors.enabled = NO;  // "チョキ"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示
    }
}

// プレイヤーが"パー"ボタンを選択した場合
- (IBAction)paper_push:(id)sender {
    
    // メッセージラベルを表示
    self.label_msg.text = @"ぽん!";
    
    // "グー", "チョキ"ボタンを隠す
    self.button_rock.hidden = YES;
    self.button_scissors.hidden = YES;
    
    // COMのジャンケンの手を決定
    srand(time(nil));
    NSInteger janken;
    janken = rand() % 3;
    
    if (janken == 0) {
        
        // COMが"グー"を選択した場合
        self.label_enemy.text = @"グー";  // COMが"グー"を出したと表示
        self.label_result.text = @"あなたの勝ち";  // ジャンケン結果を表示
        
        self.button_paper.enabled = NO;  // "パー"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示
        
    } else if (janken == 1) {
        
        // COMが"チョキ"を選択した場合
        self.label_enemy.text = @"チョキ";  // COMが"チョキ"を出したと表示
        self.label_result.text = @"あなたの負け";  // ジャンケン結果を表示
        
        self.button_paper.enabled = NO;  // "パー"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示
        
    } else if (janken == 2) {
        
        // COMが"パー"を選択した場合
        self.label_enemy.text = @"パー";  // COMが"パー"を出したと表示
        self.label_result.text = @"あいこで・・・";  // ジャンケン結果を表示
        
        // "グー", "チョキ"ボタンを表示
        self.button_rock.hidden = NO;
        self.button_scissors.hidden = NO;
    }
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
