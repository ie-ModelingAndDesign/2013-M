//
//  ViewController.h
//  Janken.ver02
//
//  Created by Yoshida Kannyuu on 2013/11/13.
//  Copyright (c) 2013年 Yoshida Kannyuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIImage *gu_img;
    UIImage *tyo_img;
    UIImage *pa_img;
}
@property (weak, nonatomic) IBOutlet UILabel *lbl_msg;
@property (weak, nonatomic) IBOutlet UILabel *lbl_aite;
@property (weak, nonatomic) IBOutlet UILabel *lbl_kekka;
@property (weak, nonatomic) IBOutlet UIButton *btn_gu;
@property (weak, nonatomic) IBOutlet UIButton *btn_tyoki;
@property (weak, nonatomic) IBOutlet UIButton *btn_pa;
@property (weak, nonatomic) IBOutlet UIButton *btn_again;
@property (weak, nonatomic) IBOutlet UIImageView *view_aite;

- (IBAction)btn_gu_dwn:(id)sender;
- (IBAction)btn_tyoki_dwn:(id)sender;
- (IBAction)btn_pa_dwn:(id)sender;
- (IBAction)btn_again_dwn:(id)sender;

//hogehgoea
@end
