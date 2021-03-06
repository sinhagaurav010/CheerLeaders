//
//  RssFeedViewController.h
//  CheerLeader
//
//  Created by preet dhillon on 14/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "MBProgressHUD.h"
#import "ModalController.h"

#import "GeneralWebViewController.h"

@interface RssFeedViewController : UIViewController
{
    
    ModalController *modal;

    IBOutlet UITableView * newsTable;
	
	UIActivityIndicatorView * activityIndicator;
	
	CGSize cellSize;
	
	NSXMLParser * rssParser;
	
	NSMutableArray * stories;
	
	
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
	
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;

}
@property(retain)NSString *stringurl;
@end
