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

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{

}

@property(strong,nonatomic)HomeViewController *homeControler;

@property(strong,nonatomic)UINavigationController *navigation;
@property (strong, nonatomic) UIWindow *window;

@end
