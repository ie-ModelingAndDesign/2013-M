//
//  MultipeerConnectivityEx.h
//  MultiTest
//
//  Created by e125719 on 2014/01/08.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

// MultipeerConectivityEx の宣言
@interface MultipeerConnectivityEx : UIViewController <UITextFieldDelegate, MCAdvertiserAssistantDelegate, MCSessionDelegate, MCBrowserViewControllerDelegate>
{
    // UI
    UITextField* _textField;
    UIButton* _btnAdvertise;
    UIButton* _btnBrowse;
    UIButton* _btnSend;
    UIButton* _btnDisconnect;
    
    // MultipeerConnectivity
    MCSessionState* _state;
    MCPeerID* _myPeerID;
    MCSession* _session;
    MCAdvertiserAssistant* _assistant;
    MCBrowserViewController* _browseViewController;
}

@end
