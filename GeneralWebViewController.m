//
//  GeneralWebViewController.m
//  CheerLeader
//
//  Created by preet dhillon on 14/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "GeneralWebViewController.h"

@implementation GeneralWebViewController
@synthesize webview,stringURL,stringTitle,isFromtab;

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

- (void)viewDidDisappear:(BOOL)animated
{
if([self.webview isLoading])
    [self.webview stopLoading];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [self.navigationController.navigationBar setTintColor:[UIColor  blackColor]];

    isFirst = 1;
//    self.webview.scalesPageToFit = YES;
//    NSString* embedHTML = @""
//    "<html><head>"
//    "<style type=\"text/css\">"
//    "body {" 
//    "background-color: transparent;"
//    "color: white;"
//    "}" 
//    "</style>"
//    "</head><body style=\"margin:0\">" 
//    "<object width=\"%0.0f\" height=\"%0.0f\"><param name=\"movie\" value=\"%@&autoplay=1\">"
//    "</param><embed src=\"%@&autoplay=1\" type=\"application/x-shockwave-flash\" width=\"%0.0f\" height=\"%0.0f\"></embed></object>"
//    "</body></html>";
//    
//    
//    CGFloat width = self.webview.frame.size.width;
//    CGFloat height = self.webview.frame.size.height;
//    NSString *html = [NSString stringWithFormat:embedHTML,
//                      width, height, YouTubeLink, YouTubeLink, width, height];
    
    
   if(self.isFromtab == 0)
   {
        self.stringURL = NewsLink;
        self.navigationItem.title = @"News";
   } 
    
    if([ModalController connectedToNetwork])
    {
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.labelText=@"Loading...";
    
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL  URLWithString:self.stringURL]]];
    }
    else
        [ModalController FuncAlertMsg:@"No Connection Found" inController:self];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    [MBProgressHUD  hideHUDForView:self.navigationController.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
//    if(isFirst == 1)
//    {
//         isFirst = 0;
    [MBProgressHUD  hideHUDForView:self.navigationController.view animated:YES];
//    [ModalController FuncAlertMsg:@"No Connection Found" inController:self];
//    }
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
