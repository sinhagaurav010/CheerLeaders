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
- (void)viewWillDisappear:(BOOL)animated
{
        if([timer isValid])
        {
            [timer  invalidate];
            timer = nil;
        }
}

-(IBAction)pause:(id)sender
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    if(buttonPlayPause.selected == 1)
    {
        buttonPlayPause.selected = 0;
    }
    else
    {
        buttonPlayPause.selected = 1;
    }
    
    if([timer isValid])
    {
        leftButon.enabled = YES;
        rightButon.enabled = YES;
        
        [timer invalidate];
        timer = nil;
    }
    else 
    {
        leftButon.enabled = NO;
        rightButon.enabled = NO;
        timer = [NSTimer  scheduledTimerWithTimeInterval:2.0 
                                                  target:self 
                                                selector:@selector(slide) 
                                                userInfo:nil 
                                                 repeats:YES];
    }
    
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    
    buttonPlayPause.enabled = YES;
    
    [buttonPlayPause  setImage:[UIImage imageNamed:@"playback_play.png"] forState:UIControlStateSelected  ];
    
    [buttonPlayPause  setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal  ];
    
    buttonPlayPause.selected = 0;
    
//    [ModalController  setGradientinView:self.view];
    counter = 0;
    self.navigationItem.title = @"Gallery";
    
    if(isPad == 0)
    {
        arrayImages = [[NSMutableArray  alloc] initWithObjects:@"April06-250.jpg", @"IC_janfeb07_250.jpg",@"IC_JanFeb11-250.jpg",@"IC_janfeb12-250.jpg",@"IC_julyaug06-250.jpg",@"IC_julyaug07_250.jpg",@"IC_julyaug08_250.jpg",@"IC_julycover_09-250.jpg",@"IC_june07-250.jpg",@"IC_marapr07-250.jpg",nil];
    }
    
    viewbuttons.userInteractionEnabled = YES;
    
    scrllGallery.userInteractionEnabled = NO;
    [scrllGallery setContentSize:CGSizeMake(320*[arrayImages  count], 367)];
    scrllGallery.pagingEnabled = YES;
    int incX = 0;
    for(int i=0;i<[arrayImages  count];i++)
    {
        
        
        UIImage *imageGal = [UIImage imageNamed:[arrayImages  objectAtIndex:i]];
        NSInteger width =  (367-imageGal.size.height)/2;
        UIImageView *imageView = [[UIImageView  alloc] initWithFrame:CGRectMake(incX, width, 320, imageGal.size.height)];
        imageView.image = imageGal;
        [scrllGallery addSubview:imageView];
        incX += 320;
    }
    
    [self.view setBackgroundColor:[UIColor  blueColor]];
    timer = [NSTimer  scheduledTimerWithTimeInterval:2.0 
                                              target:self 
                                            selector:@selector(slide) 
                                            userInfo:nil 
                                             repeats:YES];
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)slide
{
    NSLog(@"sdjkfnbkfg");
    if([scrllGallery contentOffset].x < 320*([arrayImages  count]-1))
    {
        [scrllGallery  setContentOffset:CGPointMake([scrllGallery contentOffset].x+320, 0) 
                               animated:YES];
    }
    else
    {
        [timer invalidate];
        [self.navigationController  popViewControllerAnimated:YES];
    }
}
-(IBAction)clickOnRight:(id)sender
{
    
    if(counter <[self.arrayImages count]-1)
    {
        counter++;
        
        [scrllGallery setContentOffset:CGPointMake(320*counter, 0)];
    }
}

-(IBAction)clickOnLeft:(id)sender
{
    if(counter >0)
    {
        counter--;
        
        [scrllGallery setContentOffset:CGPointMake(320*counter, 0)];
    }
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
