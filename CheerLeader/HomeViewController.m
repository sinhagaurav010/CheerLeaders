//
//  HomeViewController.m
//  CheerLeader
//
//  Created by preet dhillon on 14/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController
@synthesize imageViewAd,topStoriesview;


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
            imageViewAd.image = [UIImage imageNamed:@"icad.png"];
            stringUrl = LinkToAdd;

            counter = 3;
            
        }
            break;
        case 3:
        {
            imageViewAd.image = [UIImage imageNamed:@"vaultad.png"];
            stringUrl = URLVAULTMEDIA;
            counter = 0;
        }
            break;
        default:
            break;
    }
    
    self.topStoriesview.imageviewAd.image = [imageViewAd image];
}


-(void)hideHUD
{
    [MBProgressHUD  hideHUDForView:self.navigationController.view animated:YES];
}

-(void)clickOnCellwithIndux:(NSInteger )index andInfo:(NSDictionary *)dict;
{
    
    GeneralWebViewController *GeneralWebController = [[GeneralWebViewController  alloc] init];
    GeneralWebController.stringURL = topStoriesview.strUrl;
    
    GeneralWebController.isFromtab = 1;
    GeneralWebController.stringTitle = topStoriesview.strTitle;
    [self.navigationController  pushViewController:GeneralWebController animated:YES];


}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setTintColor:[UIColor  colorWithRed:.53 green:.53 blue:.80 alpha:1.0]];

}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//    hud.labelText = @"Loading...";
//    
//    self.topStoriesview = [[TopStoriesView alloc] init];
//    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"TopStoriesView"
//                                                    owner:self.topStoriesview                                                   options:nil];    
//    for (id object in bundle) {
//        if ([object isKindOfClass:[self.topStoriesview class]])
//            self.topStoriesview = (TopStoriesView *)object;
//    }  
//    self.topStoriesview.frame = CGRectMake(0, 0, 320, 372);
//    self.topStoriesview.delagate = self;
//    [self.topStoriesview  createTopSories];
//    [self.view  addSubview:self.topStoriesview];

    
    //        [MBProgressHUD  hideHUDForView:self.navigationController.view animated:YES];

    
//    RootViewController *rootController = [[RootViewController alloc] init];
    
//    UINavigationController *nav = [[UINavigationController  alloc]initWithRootViewController:rootController];
//
//    [self.navigationController  presentModalViewController:nav animated:YES];
//    
//    [self.navigationItem  setBackBarButtonItem:nil];
//    self.navigationItem.hidesBackButton  = YES;
    
    [self.navigationController.navigationBar setTintColor:[UIColor blueColor]];
    
     imageArray = [NSArray  arrayWithObjects:[UIImage imageNamed:@"icad.png"],
                                             [UIImage imageNamed:@"iPhone_Shoe.png"],
                                             [UIImage  imageNamed:@"EPIC_iPhone.jpg"], 
                                             [UIImage imageNamed:@"vaultad.png"],
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
    
    gesture = [[UITapGestureRecognizer  alloc] initWithTarget:self 
                                                       action:@selector(goToAd:)];
    self.topStoriesview.imageviewAd.userInteractionEnabled = YES;
    [self.topStoriesview.imageviewAd  addGestureRecognizer:gesture];
    
    UIImageView *imageTitle = [[UIImageView  alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    imageTitle.image = [UIImage imageNamed:@"IC_Logo-1.png"];
    self.navigationItem.titleView = imageTitle;
    
    COLORNAV
    
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
