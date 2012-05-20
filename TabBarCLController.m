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
    
    CATransition* transition = [CATransition animation];
    transition.duration = 2.0;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromTop;
    
    [self.navigationController.view.layer 
     addAnimation:transition forKey:kCATransition];
    
    
    [self.navigationController pushViewController: tabbarcontroller animated:NO];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.tabbarcontroller.delegate = self;
    
    [NSTimer    scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(goToHome) userInfo:nil repeats:NO];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    UINavigationController *navigation = (UINavigationController *)viewController;
    
    if([tabbarcontroller selectedIndex] == 0)
    {
        if([[navigation.viewControllers objectAtIndex:0] isKindOfClass:[HomeViewController  class]])
        {
            [[[navigation.viewControllers objectAtIndex:0] topStoriesview] removeTop];
        }
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
