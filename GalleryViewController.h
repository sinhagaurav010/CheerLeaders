//
//  GalleryViewController.h
//  CheerLeader
//
//  Created by preet dhillon on 15/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

@interface GalleryViewController : UIViewController
{
    NSInteger counter;
}
@property(retain)    IBOutlet UIScrollView *scrllGallery;

@property(retain)    NSMutableArray *arrayImages;


-(IBAction)clickOnRight:(id)sender;

-(IBAction)clickOnLeft:(id)sender;
@end
