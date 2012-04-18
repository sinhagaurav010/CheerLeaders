//
//  GalleryViewController.m
//  CheerLeader
//
//  Created by preet dhillon on 15/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "GalleryViewController.h"

@implementation GalleryViewController
@synthesize arrayImages,scrllGallery;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    self.navigationItem.title = @"Gallery";
    
    if(isPad == 0)
    {
        arrayImages = [[NSMutableArray  alloc] initWithObjects:@"April06-250.jpg", @"IC_janfeb07_250.jpg",@"IC_JanFeb11-250.jpg",@"IC_janfeb12-250.jpg",@"IC_julyaug06-250.jpg",@"IC_julyaug07_250.jpg",@"IC_julyaug08_250.jpg",@"IC_julycover_09-250.jpg",@"IC_june07-250.jpg",@"IC_marapr07-250.jpg",nil];
    }
    
    
    
    [scrllGallery setContentSize:CGSizeMake(320*[arrayImages  count], 416)];
    scrllGallery.pagingEnabled = YES;
    int incX = 0;
    for(int i=0;i<[arrayImages  count];i++)
    {
        
        
        UIImage *imageGal = [UIImage imageNamed:[arrayImages  objectAtIndex:i]];
        NSInteger width =  (416-imageGal.size.height)/2;
        UIImageView *imageView = [[UIImageView  alloc] initWithFrame:CGRectMake(incX, width, 320, imageGal.size.height)];
        imageView.image = imageGal;
        [scrllGallery addSubview:imageView];
        incX += 320;
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
