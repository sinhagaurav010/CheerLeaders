//
//  AppDelegate.h
//  CheerLeader
//
//  Created by preet dhillon on 14/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "HomeViewController.h"
#import "TabBarCLController.h"

////BizPlusDevDevDev is Provision profile

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{

}
@property(strong,nonatomic)TabBarCLController *splashController;
@property(strong,nonatomic)HomeViewController *homeControler;

@property(strong,nonatomic)UINavigationController *navigation;
@property (strong, nonatomic) UIWindow *window;

@end
