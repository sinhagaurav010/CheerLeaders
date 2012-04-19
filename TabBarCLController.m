//
//  TabBarCLController.m
//  CheerLeader
//
//  Created by preet dhillon on 19/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "TabBarCLController.h"

@implementation TabBarCLController
@synthesize tabbarcontroller;

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

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController  setNavigationBarHidden:YES];
}


-(void)goToHome
{

    [self.navigationController  pushViewController:self.tabbarcontroller animated:YES];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    
    
    [NSTimer    scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(goToHome) userInfo:nil repeats:NO];
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
