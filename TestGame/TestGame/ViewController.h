//
//  ViewController.h
//  TestGame
//
//  Created by Yoshida Kannyuu on 2013/11/27.
//  Copyright (c) 2013年 Yoshida Kannyuu. All rights reserved.
//

#import <GameKit/GameKit.h>
#import <UIKit/UIKit.h>

//BlueToothTestViewController.h
#import <GameKit/GameKit.h>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate,GKPeerPickerControllerDelegate,GKSessionDelegate>{
    GKPeerPickerController *picker;
    GKSession *currentSession;
    
    UITextField *txtMessage;
    UIButton *sentBtn;
    UIButton *connectedBtn;
    UIButton *disconnectedBtn;
}

- (void)btnSend:(id) sender;
- (void)btnConnect:(id) sender;
- (void)btnDisconnect:(id) sender;
- (void)mySendDataToPeers:(NSData *)data;

@property (nonatomic, retain) GKPeerPickerController *picker;
@property (nonatomic, retain) GKSession *currentSession;
@property (nonatomic, retain) UITextField *txtMessage;
@property (nonatomic, retain) UIButton *connectedBtn;
@property (nonatomic, retain) UIButton *disconnectedBtn;

@end
