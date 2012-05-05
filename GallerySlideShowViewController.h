//
//  GallerySlideShowViewController.h
//  CheerLeader
//
//  Created by preet dhillon on 06/05/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
@interface GallerySlideShowViewController : UIViewController

{
    
    IBOutlet UIButton *buttonPlayPause;
    IBOutlet UIButton *leftButon;
    IBOutlet UIButton *rightButon;
    
    
    IBOutlet UIView *viewbuttons;
    NSInteger counter;
    NSTimer *timer;

}

-(IBAction)clickOnRight:(id)sender;

-(IBAction)pause:(id)sender;

-(IBAction)clickOnLeft:(id)sender;


@property(assign)NSInteger atIndex;
@property(retain)    NSMutableArray *arrayImages;

@property(retain)    IBOutlet UIScrollView *scrllGallery;

@end
