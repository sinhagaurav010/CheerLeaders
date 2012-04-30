//
//  ContactViewController.m
//  CheerLeader
//
//  Created by preet dhillon on 20/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "ContactViewController.h"

@implementation ContactViewController

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


-(void)Submit
{
    NSString *strMsg= @" ";
    
    for (int i=0; i<[arraytextField  count]; i++) {
        NSLog(@"äasdkmfd");
        strMsg = [strMsg stringByAppendingFormat:@"%@:",[arrayOption objectAtIndex:i]];
        
        if([[arraytextField  objectAtIndex:i] text])
            strMsg = [strMsg stringByAppendingFormat:@"%@\n",[[arraytextField  objectAtIndex:i] text]];
 
    }
    [self clickOn:EMAILTO withMessage:strMsg];

}


#pragma mark -mail composer-
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	[self dismissModalViewControllerAnimated:YES];
}


-(void)clickOn:(NSString *)stringEmailId withMessage:(NSString *)strMsg
{
    //NSLog(@"clickon");
	NSArray *arrayRec = [NSArray arrayWithObjects:stringEmailId,nil];
    //NSLog(@"%d",[MFMailComposeViewController canSendMail]);
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *mcvc = [[[MFMailComposeViewController alloc] init] autorelease];
		mcvc.mailComposeDelegate = self;
		//[mcvc setSubject:EMAILSUB];
		[mcvc setToRecipients:arrayRec];
        
        
        //		NSString *messageBdy = [NSString stringWithFormat:@"Name %@<br>Phone %@ <br>Address %@<br>%@<br>City %@ <br>%@<br> %@<br>special features%@",textname.text,textphone.text,textAddress.text,buttonTime.titleLabel.text,textCity.text,buttonBed.titleLabel.text,buttonBath.titleLabel.text,textfea.text];
        
        [mcvc setMessageBody:strMsg    isHTML:NO];
		
        //[mcvc addAttachmentData:UIImageJPEGRepresentation(imageToEmail, 1.0f) mimeType:@"image/jpeg" fileName:@"pickerimage.jpg"];
		[self presentModalViewController:mcvc animated:YES];
	}	
    else
    {
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"Info"
                                                           message:@"Please Configure Email" 
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles: nil];
        [alerView show];
        [alerView release];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
      self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Submit" 
                                                                             style:UIBarButtonItemStyleBordered 
                                                                            target:self
                                                                            action:@selector(Submit)];
//    [ModalController  setGradientinView:self.view];

    tableViewCont.backgroundView = nil;
    tableViewCont.backgroundColor = [UIColor  clearColor],
    
    [self.navigationController.navigationBar setTintColor:[UIColor  blackColor]];
    
    self.navigationItem.title = @"Contacts";
    
    [self.navigationController.navigationBar setTintColor:[UIColor  blackColor]];
    
    arrayOption = [[NSMutableArray  alloc] initWithObjects:@"Name",@"Email",@"Message", nil];
    arraytextField = [[NSMutableArray  alloc] init];

    for (int i=0; i<[arrayOption count]; i++) 
    {
        UITextField *field = [[UITextField alloc] init];
        field.delegate = self;
        
        [arraytextField  addObject:field];
    }
    
    
    
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
    
//    webview.delegate = self;
//    
//    if([ModalController connectedToNetwork])
//    {
//        
//        MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//        hud.labelText=@"Loading...";
//        
//        [webview loadRequest:[NSURLRequest requestWithURL:[NSURL  URLWithString:CONTACTURL]]];
//        
//    }
//    else
//        [ModalController FuncAlertMsg:@"No Connection Found" inController:self];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(![textField isEqual:[arraytextField objectAtIndex:0]])
        [tableViewCont setContentOffset:CGPointMake(0, 110) animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [tableViewCont setContentOffset:CGPointMake(0, 0) animated:YES];

    [textField resignFirstResponder];
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [arrayOption count];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return [arrayOption objectAtIndex:section];
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *viewLabel = [[UIView  alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UILabel *lablestr = [[UILabel  alloc] initWithFrame:CGRectMake(10, 7, 300, 30)];
//    lablestr.textColor  = [UIColor whiteColor];
    lablestr.backgroundColor = [UIColor  clearColor];
    lablestr.font = [UIFont boldSystemFontOfSize:15.0];
    lablestr.text = [arrayOption objectAtIndex:section];
    [viewLabel  addSubview:lablestr];
    return viewLabel;
    
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	
    return  44.0;
}


//
//-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//	
//    return  40.0;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault	reuseIdentifier:CellIdentifier] ;
    }
	
	// Configure the cell.
	
 	UITextField *field = [arraytextField  objectAtIndex:indexPath.section];
    field.frame = CGRectMake(5, 10, cell.contentView.frame.size.width-10,cell.contentView.frame.size.height-10);
    
    [cell.contentView    addSubview:field];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //    cell.detailTextLabel.text = [[arrayHistory objectAtIndex:row1] objectForKey:TIMESTAMP];
    //   	cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16.0];
    //    cell.textLabel.backgroundColor= [UIColor clearColor];
    //    cell.accessoryType = 1;
    //	cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
    //    cell.detailTextLabel.backgroundColor= [UIColor clearColor];
	
    return cell;
}


//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    
//    [MBProgressHUD  hideHUDForView:self.navigationController.view animated:YES];
//}
//
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
//{
//    //    if(isFirst == 1)
//    //    {
//    //         isFirst = 0;
//    [MBProgressHUD  hideHUDForView:self.navigationController.view animated:YES];
//    //    [ModalController FuncAlertMsg:@"No Connection Found" inController:self];
//    //    }
//}
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
