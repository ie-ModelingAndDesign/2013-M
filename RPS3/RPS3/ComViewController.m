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
    
    
    gu_img = [ UIImage imageNamed:@"gu.png"];
    cho_img = [ UIImage imageNamed:@"choki.png"];
    pa_img = [ UIImage imageNamed:@"pa.png"];
    win_img = [ UIImage imageNamed:@"win.png"];
    lose_img = [ UIImage imageNamed:@"lose.png"];
     [super viewDidLoad];
        
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"kime.png"]];
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// プレイヤーが"グー"ボタンを選択した場合
- (IBAction)rock_push:(id)sender {
    self.view_aite.hidden = NO;
    self.view_kekka.hidden = NO;


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
       // self.label_enemy.text = @"グー";  // COMが"グー"を出したと表示
        self.view_aite.image = gu_img;
        self.view_kekka.hidden = YES;
        self.label_result.text = @"あいこで・・・";  // じゃんけん結果を表示
        
        // "チョキ", "パー"ボタンを表示
        self.button_scissors.hidden = NO;
        self.button_paper.hidden = NO;
        
    } else if (janken == 1) {
        
        // COMが"チョキ"を選択した場合
        self.label_enemy.text = @"チョキ";  // COMが"チョキ"を出したと表示
        self.view_aite.image = cho_img;

        self.view_kekka.image = win_img;
        
        self.label_result.text = @"";
        
        self.button_rock.enabled = NO;  // "グー"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示

    } else if (janken == 2) {
        
        // COMが"パー"を選択した場合
        self.label_enemy.text = @"パー";  // COMが"パー"を出したと表示
        self.view_aite.image = pa_img;

        self.view_kekka.image = lose_img;
        
        self.label_result.text = @"";

        self.button_rock.enabled = NO;  // "グー"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示
    }
}

// プレイヤーが"チョキ"ボタンを選択した場合
- (IBAction)scissors_push:(id)sender {
    self.view_aite.hidden = NO;
    self.view_kekka.hidden = NO;

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
        self.view_aite.image = gu_img;
        self.view_kekka.image = lose_img;
        self.label_result.text = @"";

        
        self.button_scissors.enabled = NO;  // "チョキ"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示

    } else if (janken == 1) {
        
        // COMが"チョキ"を選択した場合
        self.label_enemy.text = @"チョキ";  // COMが"チョキ"を出したと表示
        self.view_aite.image = cho_img;
        self.view_kekka.hidden = YES;
        self.label_result.text = @"あいこで・・・";  // ジャンケン結果を表示
        
        // "グー", "パー"ボタンを表示
        self.button_rock.hidden = NO;
        self.button_paper.hidden = NO;
    
    } else if (janken == 2) {
        
        // COMが"パー"を選択した場合
        self.label_enemy.text = @"パー";  // COMが"パー"を出したと表示
        self.view_aite.image = pa_img;
        self.view_kekka.image = win_img;
        self.label_result.text = @"";

        self.button_scissors.enabled = NO;  // "チョキ"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示
    }
}

// プレイヤーが"パー"ボタンを選択した場合
- (IBAction)paper_push:(id)sender {
    self.view_aite.hidden = NO;
    self.view_kekka.hidden = NO;
    
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
        self.view_aite.image = gu_img;
        self.view_kekka.image = win_img;
        self.label_result.text = @"";

        self.button_paper.enabled = NO;  // "パー"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示
    
    } else if (janken == 1) {
        
        // COMが"チョキ"を選択した場合
        self.label_enemy.text = @"チョキ";  // COMが"チョキ"を出したと表示
        self.view_aite.image = cho_img;
        self.view_kekka.image = lose_img;
        self.label_result.text = @"";
        self.button_paper.enabled = NO;  // "パー"ボタンを使用不可に
        self.button_again.hidden = NO;  // "もう一度"ボタンを表示

    } else if (janken == 2) {
        
        // COMが"パー"を選択した場合
        self.label_enemy.text = @"パー";  // COMが"パー"を出したと表示
        self.view_aite.image = pa_img;
        self.view_kekka.hidden = YES;
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
    self.view_aite.hidden = YES;
    self.view_kekka.hidden = YES;
}
@end
