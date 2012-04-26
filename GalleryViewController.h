//
//  GalleryViewController.h
//  CheerLeader
//
//  Created by preet dhillon on 15/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "ModalController.h"
@interface GalleryViewController : UIViewController
{
    
    IBOutlet UIButton *buttonPlayPause;
    
    NSInteger counter;
    NSTimer *timer;
}
@property(retain)    IBOutlet UIScrollView *scrllGallery;

@property(retain)    NSMutableArray *arrayImages;


-(IBAction)clickOnRight:(id)sender;

-(IBAction)pause:(id)sender;

-(IBAction)clickOnLeft:(id)sender;
@end
