//
//  HomeViewController.h
//  CheerLeader
//
//  Created by preet dhillon on 14/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssFeedViewController.h"
#import "GeneralWebViewController.h"
#import "SocialNetViewController.h"
#import "GalleryViewController.h"

@interface HomeViewController : UIViewController


@property(retain)IBOutlet UIImageView *imageViewAd;

-(IBAction)RSSFeed:(id)sender;
-(IBAction)SocialNet:(id)sender;
-(IBAction)YouTube:(id)sender;
-(IBAction)radioShow:(id)sender;
-(IBAction)newsLetter:(id)sender;
-(IBAction)gallery:(id)sender;
-(IBAction)Event:(id)sender;


@end
