//
//  ContactViewController.h
//  CheerLeader
//
//  Created by preet dhillon on 20/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "ModalController.h"
#import "Global.h"
#import <MessageUI/MessageUI.h>
@interface ContactViewController : UIViewController<UITextFieldDelegate,MFMailComposeViewControllerDelegate>
{
    NSMutableArray *arraytextField;
    NSMutableArray *arrayOption;
    IBOutlet UITableView *tableViewCont;
}
-(void)clickOn:(NSString *)stringEmailId withMessage:(NSString *)strMsg;

@end
