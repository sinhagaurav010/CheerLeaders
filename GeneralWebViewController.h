//
//  GeneralWebViewController.h
//  CheerLeader
//
//  Created by preet dhillon on 14/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "MBProgressHUD.h"
#import "SocialNetViewController.h"
#import "ModalController.h"
@interface GeneralWebViewController : UIViewController
{
    IBOutlet UIWebView *webview;
    BOOL isFirst;
}


@property(assign)BOOL isFromtab;
@property(retain)    IBOutlet UIWebView *webview;
@property(retain) NSString *stringURL;
@property(retain) NSString *stringTitle;

@end
