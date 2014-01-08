//
//  MultipeerController.h
//  RPS3
//
//  Created by e125719 on 2014/01/08.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface MultipeerController : UIViewController <UITextFieldDelegate, MCAdvertiserAssistantDelegate, MCSessionDelegate, MCBrowserViewControllerDelegate> {
    UITextField* name;
    UIButton* advertise;
}

@end
