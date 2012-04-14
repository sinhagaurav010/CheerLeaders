//
//  HomeViewController.m
//  CheerLeader
//
//  Created by preet dhillon on 14/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

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
    RssFeedViewController *rssController = [[RssFeedViewController alloc] init];
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
    [self.navigationController  pushViewController:GeneralWebController animated:YES];
    
}
-(IBAction)radioShow:(id)sender
{}
-(IBAction)newsLetter:(id)sender
{
    GeneralWebViewController *GeneralWebController = [[GeneralWebViewController  alloc] init];
    GeneralWebController.stringURL = NewsLink;
    [self.navigationController  pushViewController:GeneralWebController animated:YES];
}

-(IBAction)gallery:(id)sender
{
    GalleryViewController *GalleryController = [[GalleryViewController alloc] init];
    [self.navigationController  pushViewController:GalleryController animated:YES];
    
}

-(IBAction)Event:(id)sender
{
    RssFeedViewController *rssController = [[RssFeedViewController alloc] init];
    [self.navigationController  pushViewController:rssController animated:YES];
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
