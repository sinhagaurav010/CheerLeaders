//
//  SocialNetViewController.m
//  CheerLeader
//
//  Created by preet dhillon on 14/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "SocialNetViewController.h"

@implementation SocialNetViewController

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


-(IBAction)ClickOnFB:(id)sender
{
    GeneralWebViewController *GeneralWebController = [[GeneralWebViewController  alloc] init];
    GeneralWebController.stringURL = FacebookLink;
    GeneralWebController.isFromtab = 1;
    GeneralWebController.stringTitle  = @"FaceBook";

    [self.navigationController  pushViewController:GeneralWebController animated:YES];

}
-(IBAction)ClickOnTwitter:(id)sender
{
    GeneralWebViewController *GeneralWebController = [[GeneralWebViewController  alloc] init];
    GeneralWebController.stringURL = TwitterLink;
    GeneralWebController.isFromtab = 1;
    GeneralWebController.stringTitle  = @"Twitter";

    [self.navigationController  pushViewController:GeneralWebController animated:YES];
}


-(IBAction)ClickOnLinkedIn:(id)sender
{
    GeneralWebViewController *GeneralWebController = [[GeneralWebViewController  alloc] init];
    GeneralWebController.stringURL = FacebookLink;
    GeneralWebController.isFromtab = 1;
    GeneralWebController.stringTitle  = @"Linkedin";


    [self.navigationController  pushViewController:GeneralWebController animated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    self.navigationItem.title = @"Social Network";

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
