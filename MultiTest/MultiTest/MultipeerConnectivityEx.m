//
//  MultipeerConnectivityEx.m
//  MultiTest
//
//  Created by e125719 on 2014/01/08.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "MultipeerConnectivityEx.h"

#define BTN_ADVERTIZE 0
#define BTN_BROWSE 1
#define BTN_SEND 2
#define BTN_DISCONNECT 3

#define SERVICE_TYPE @"MyService"

// MultipeerConectivityEx の実装
@implementation MultipeerConnectivityEx

// アラートの表示
-(void)showAlert:(NSString*)title text:(NSString*)text
{
    UIAlertView* alert=[[UIAlertView alloc]
                        initWithTitle:title message:text delegate:nil
                        cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

// 文字列 => データ
-(NSData*)str2data:(NSString*)str
{
    return [str dataUsingEncoding:NSUTF8StringEncoding];
}

// データ => 文字列
-(NSString*)data2str:(NSData*)data
{
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
}

// テキストフィールドの生成
-(UITextField*)makeTextField:(CGRect)rect text:(NSString*)text
{
    UITextField* textField=[[UITextField alloc] init];
    [textField setText:text];
    [textField setFrame:rect];
    [textField setReturnKeyType:UIReturnKeyDone];
    [textField setBackgroundColor:[UIColor whiteColor]];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [textField setDelegate:self];
    return textField;
}

// テキストボタンの生成
-(UIButton*)makeButton:(CGRect)rect text:(NSString*)text tag:(int)tag
{
    UIButton* button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:rect];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTag:tag];
    [button addTarget:self action:@selector(clickButton:)
     forControlEvents:UIControlEventTouchUpInside];
    return button;
}

// UI状態の指定
-(void)updateUI
{
    if(_state==MCSessionStateNotConnected) {
        _btnAdvertise.alpha = 1.0f;
        _btnBrowse.alpha = 1.0f;
        _btnSend.alpha = 0.0f;
        _btnDisconnect.alpha = 0.0f;
    
    }
    
    // セッション接続中
    else if(_state==MCSessionStateConnecting) {
        _btnAdvertise.alpha = 0.0f;
        _btnBrowse.alpha = 0.0f;
        _btnSend.alpha = 0.0f;
        _btnDisconnect.alpha = 0.0f;
    }
    
    // セッション接続
    else if(_state==MCSessionStateConnected) {
        _btnAdvertise.alpha = 0.0f;
        _btnBrowse.alpha = 0.0f;
        _btnSend.alpha = 1.0f;
        _btnDisconnect.alpha = 1.0f;
    }
}

// テキストフィールドの更新
-(void)updateTextField:(NSString*)text
{
    _textField.text = text;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // ピアIDの生成
    _myPeerID = [[MCPeerID alloc] initWithDisplayName:@"MyDevice"];
    
    // セッションの生成
    _session = [[MCSession alloc] initWithPeer:_myPeerID];
    _session.delegate = self;
    
    // テキストフィールドの生成
    _textField = [self makeTextField:CGRectMake(10, 20, 300, 32) text:@""];
    [self.view addSubview:_textField];
    
    // アドバタイズボタンの生成
    _btnAdvertise = [self makeButton:CGRectMake(60, 70, 90, 40) text:@"アドバタイズ" tag:BTN_ADVERTIZE];
    [self.view addSubview:_btnAdvertise];
    
    // ブラウズボタンの生成
    _btnBrowse = [self makeButton:CGRectMake(160, 70, 90, 40) text:@"ブラウズ"　tag:BTN_BROWSE];
    [self.view addSubview:_btnBrowse];
    
    // 送信ボタンの生成
    _btnSend = [self makeButton:CGRectMake(60, 70, 90, 40) text:@"送信" tag:BTN_SEND];
    [self.view addSubview:_btnSend];
    
    // 切断ボタンの生成
    _btnDisconnect = [self makeButton:CGRectMake(160, 70, 90, 40) text:@"切断" tag:BTN_DISCONNECT];
    [self.view addSubview:_btnDisconnect];
    
    // UIの更新
    _state = MCSessionStateNotConnected;
    [self updateUI];
}

// テキストフィールドのリターン時に呼ばれる
-(BOOL)textFieldShouldReturn:(UITextField*)sender
{
    [sender resignFirstResponder];
    return YES;
}

// ボタンクリック時に呼ばれる
-(IBAction)clickButton:(UIButton*)sender
{
    
    // アドバタイズの開始
    if(sender.tag==BTN_ADVERTIZE) {
        MCAdvertiserAssistant* assistant = [[MCAdvertiserAssistant alloc]
                                            initWithServiceType:SERVICE_TYPE discoveryInfo:nil session:_session];
        [assistant start];
        
        [self showAlert:@"" text:@"アドバタイズ開始しました"];
    }
    
    // ブラウズの開始
    if(sender.tag==BTN_BROWSE) {
        _browseViewController = [[MCBrowserViewController alloc]
                                 initWithServiceType:SERVICE_TYPE session:_session];
        _browseViewController.delegate = self;
        [self presentViewController:_browseViewController animated:YES completion:nil];
    }
    
    // メッセージの送信
    else if(sender.tag==BTN_SEND) {
        NSData* data = [self str2data:_textField.text];
        NSArray* peerIDs = [_session connectedPeers];
        NSError* error = nil;
        [_session sendData:data toPeers:peerIDs withMode:MCSessionSendDataReliable error:&error];
    }
    
    // セッションの切断
    else if(sender.tag==BTN_DISCONNECT) {
        [_session disconnect];
        _state = MCSessionStateNotConnected;
        [self updateUI];
    }
}



/*
 * セッションのデリゲート
 */

// NSDataオブジェクト受信開始時に呼ばれる
-(void)session:(MCSession*)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    [self performSelectorOnMainThread:@selector(updateTextField:) withObject:[self data2str:data] waitUntilDone:NO];
}

-(void)session:(MCSession*)session didStartReceivingResourceWithName:(NSString *)resourceName
      fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{
    
}

// ファイルリソースの受信終了時に呼ばれる
-(void)session:(MCSession*)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{
    
}

// バイトストリームの接続開始時に呼ばれる
-(void)session:(MCSession*)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{
    
}

// 状態変更時に呼ばれる
-(void)session:(MCSession*)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    // UI状態の更新
    _state = state;
    [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:NO];
}

/*
 * ブラウザのビューコントローラのデリゲート
 */

// ブラウズ終了時に呼ばれる
-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    [_browseViewController dismissViewControllerAnimated:YES completion:nil];
}

// ブラウズキャンセル時に呼ばれる
-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    [_browseViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
