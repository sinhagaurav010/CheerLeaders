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
@interface ContactViewController : UIViewController<UIWebViewDelegate>
{
    IBOutlet UIWebView *webview;
}
@end
