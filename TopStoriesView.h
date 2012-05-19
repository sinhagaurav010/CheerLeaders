//
//  TopStoriesView.h
//  CheerLeader
//
//  Created by preet dhillon on 19/05/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedParser.h"
#import "Global.h"

@protocol TopStoriesDelegate <NSObject>

-(void)hideHUD;
-(void)clickOnCellwithIndux:(NSInteger )index andInfo:(NSDictionary *)dict;

@end
@interface TopStoriesView : UIView

{
    MWFeedParser *feedParser;
	NSMutableArray *parsedItems;
	
	// Displaying
	NSArray *itemsToDisplay;
	NSDateFormatter *formatter;
}
@property(retain)NSString *strTitle;
@property(retain)NSString *strUrl;

@property(retain) IBOutlet UIImageView *imageviewAd;
@property(retain) IBOutlet UITableView *tableTopStories;
@property (nonatomic, retain) NSArray *itemsToDisplay;
@property(retain)id<TopStoriesDelegate>delagate;
-(void)createTopSories;
-(void)removeTop;
@end
