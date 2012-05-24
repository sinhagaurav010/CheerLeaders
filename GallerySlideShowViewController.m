//
//  GallerySlideShowViewController.m
//  CheerLeader
//
//  Created by preet dhillon on 06/05/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "GallerySlideShowViewController.h"

@implementation GallerySlideShowViewController

@synthesize scrllGallery,arrayImages,atIndex;

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
    buttonPlayPause.enabled = YES;
    
    [buttonPlayPause  setImage:[UIImage imageNamed:@"playback_play.png"] forState:UIControlStateSelected  ];
    
    [buttonPlayPause  setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal  ];
    
    buttonPlayPause.selected = 0;
    
    //    [ModalController  setGradientinView:self.view];
    counter = 0;
    self.navigationItem.title = @"Gallery";
    arrayImages = [[NSMutableArray  alloc] init];
    if(isPad == 0)
    {
        for(int i=1;i<=47;i++)
        {
            NSString *imageName = [NSString stringWithFormat:@"CL_%d",i];
            if(i ==2 || i==4 || i== 6 || i==7 || i== 8)
                imageName = [imageName  stringByAppendingString:@".tif"];
            else
                imageName = [imageName  stringByAppendingString:@".jpg"];
            
            [arrayImages addObject:imageName];
            
        }
//        arrayImages = [[NSMutableArray  alloc] initWithObjects:@"April06-250.jpg", @"IC_janfeb07_250.jpg",@"IC_JanFeb09-250.jpg",@"IC_JanFeb11-250.jpg",@"IC_janfeb12-250.jpg",@"IC_julyaug06-250.jpg",@"IC_julyaug07_250.jpg",@"IC_julyaug08_250.jpg",@"IC_JulyAug11-250.jpg",@"IC_julycover_09-250.jpg",@"IC_june07-250.jpg",@"IC_marapr07-250.jpg",@"IC_marapr09-250.jpg",@"IC_marapr10-250.jpg",@"IC_marapr11-250.jpg",@"IC_mayjune08-250.jpg",@"IC_MayJune09-250.jpg",@"IC_MayJune10-250.jpg",@"IC_novdec08_250.jpg",@"IC_novdec11-250.jpg",@"IC_NovDec_10-250.jpg",@"IC_sepoct11-250.jpg",@"IC_septoct06-250.jpg",@"IC_septoct08_250.jpg",@"IC_septoct10-250.jpg",@"IC_septoct_09-250.jpg",@"iCJanFeb05.jpg",@"ICjanfeb08-250.jpg",@"iCJulyAug10-250.jpg",@"ICnovdec06-250.jpg",@"ICnovdec07-250.jpg",@"ICnovdec09-250.jpg",@"ICsepoct07_250.jpg",@"mayJune06_IC-250.jpg",nil];
    }

    
    scrllGallery.pagingEnabled = YES;
    int incX = 0;
    for(int i=0;i<[arrayImages  count];i++)
    {
        
        
        UIImage *imageGal = [UIImage imageNamed:[arrayImages  objectAtIndex:i]];
//        NSInteger width =  (367-imageGal.size.height)/2;
        UIImageView *imageView = [[UIImageView  alloc] initWithFrame:CGRectMake(incX, 0, 320, 372)];
        imageView.image = imageGal;
        [scrllGallery addSubview:imageView];
        incX += 320;
    }
    
    timer = [NSTimer  scheduledTimerWithTimeInterval:2.0 
                                              target:self 
                                            selector:@selector(slide) 
                                            userInfo:nil 
                                             repeats:YES];
    
    [self.scrllGallery  setContentOffset:CGPointMake(atIndex*320, 0)];
    counter = atIndex;
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
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
-(void)slide
{
    if([scrllGallery contentOffset].x < 320*([arrayImages  count]-1))
    {
        [scrllGallery  setContentOffset:CGPointMake([scrllGallery contentOffset].x+320, 0) 
                               animated:YES];
        counter++;
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
