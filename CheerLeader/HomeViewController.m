//
//  HomeViewController.m
//  CheerLeader
//
//  Created by preet dhillon on 14/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController
@synthesize imageViewAd;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)RSSFeed:(id)sender
{
    RootViewController *rssController = [[RootViewController alloc] init];
    rssController.stringURL = RSSFeedLink;
    rssController.titleString = @"The Buzz",
    [self.navigationController  pushViewController:rssController animated:YES];

}
-(IBAction)SocialNet:(id)sender
{
    
    SocialNetViewController *SocialNetController = [[SocialNetViewController alloc] init];
    [self.navigationController  pushViewController:SocialNetController animated:YES];
}
-(IBAction)YouTube:(id)sender
{
    GeneralWebViewController *GeneralWebController = [[GeneralWebViewController  alloc] init];
    GeneralWebController.stringURL = YouTubeLink;
    GeneralWebController.isFromtab = 1;
    GeneralWebController.stringTitle  = @"You Tube";

    [self.navigationController  pushViewController:GeneralWebController animated:YES];
    
}
-(IBAction)radioShow:(id)sender
{}
-(IBAction)newsLetter:(id)sender
{
//    GeneralWebViewController *GeneralWebController = [[GeneralWebViewController  alloc] init];
//    GeneralWebController.stringURL = NewsLink;
//    GeneralWebController.isFromtab = 1;
//    GeneralWebController.stringTitle  = @"NewsLetter";
//    
//    [self.navigationController  pushViewController:GeneralWebController animated:YES];

    RootViewController *rssController = [[RootViewController alloc] init];
    rssController.stringURL = URLEVENT;
    rssController.titleString = @"Events";
    [self.navigationController  pushViewController:rssController animated:YES];
}

-(IBAction)gallery:(id)sender
{
    GalleryViewController *GalleryController = [[GalleryViewController alloc] init];
    [self.navigationController  pushViewController:GalleryController animated:YES];
    
}

-(IBAction)Event:(id)sender
{
    GeneralWebViewController *GeneralWebController = [[GeneralWebViewController  alloc] init];
    GeneralWebController.stringURL = SUBSRIBE;
    GeneralWebController.isFromtab = 1;
    GeneralWebController.stringTitle  = @"Subscribe";
    
    [self.navigationController  pushViewController:GeneralWebController animated:YES];
//    RssFeedViewController *rssController = [[RssFeedViewController alloc] init];
//    [self.navigationController  pushViewController:rssController animated:YES];
}



- (void)didReceiveMemoryWarning
{
    
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)goToAd:(UITapGestureRecognizer *)recognizer
{
       [[UIApplication  sharedApplication] openURL:[NSURL URLWithString:stringUrl]];
}

-(void)changeAd
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    switch (counter) {
        case 0:
        {
            imageViewAd.image = [UIImage imageNamed:@"iPhone_Shoe.png"];
            stringUrl = URLSHOE;
            counter = 1;
            
        }
            break;
        case 1:
        {
            imageViewAd.image = [UIImage  imageNamed:@"EPIC_iPhone.jpg"];
            stringUrl = URLEPIC;
            counter = 2;
            
        }
            break;
        case 2:
        {
            imageViewAd.image = [UIImage imageNamed:@"AdCheerLeader.png"];
            stringUrl = LinkToAdd;

            counter = 3;
            
        }
            break;
        case 3:
        {
            imageViewAd.image = [UIImage imageNamed:@"vault-320.png"];
            stringUrl = URLVAULTMEDIA;
            
            counter = 0;
            
        }
            break;
        default:
            break;
    }

}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
     imageArray = [NSArray  arrayWithObjects:[UIImage imageNamed:@"AdCheerLeader.png"],
                                             [UIImage imageNamed:@"iPhone_Shoe.png"],
                                             [UIImage  imageNamed:@"EPIC_iPhone.jpg"], 
                                             [UIImage imageNamed:@"vault-320.png"],
                                             nil];
    
    timerAd = [NSTimer   scheduledTimerWithTimeInterval:3.0 
                                                 target:self 
                                               selector:@selector(changeAd) 
                                               userInfo:nil 
                                                repeats:YES];
    
    
    
//    self.imageViewAd.animationImages = [NSArray arrayWithArray:imageArray];
//    self.imageViewAd.animationDuration = 12.0;
//    self.imageViewAd.animationRepeatCount = 0;
//    [self.imageViewAd startAnimating];
    
    
//    [ModalController  setGradientinView:self.view];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer  alloc] initWithTarget:self 
                                                                               action:@selector(goToAd:)];
    imageViewAd.userInteractionEnabled = YES;
    [imageViewAd addGestureRecognizer:gesture];
    
    
    
    [self.navigationController.navigationBar setTintColor:[UIColor  blackColor]];
    self.navigationItem.title = @"Inside Cheerleading";
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
