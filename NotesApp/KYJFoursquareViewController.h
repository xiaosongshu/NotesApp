//
//  KYJFoursquareViewController.h
//  NotesApp
//
//  Created by Kevin Jiang on 3/11/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYJNotes.h"

@class KYJFoursquareViewController;

@protocol KYJFourSquareDelegate
//-(void)foursquareNote: (KYJNotes*)passedNote;
-(void)foursquareTableViewController: (KYJFoursquareViewController *)controller foursquareNote: (KYJNotes*)passedNote;
@end

@interface KYJFoursquareViewController : UITableViewController <NSURLConnectionDataDelegate>

@property (nonatomic, strong) id <KYJFourSquareDelegate> delegate;

@property (nonatomic, strong) NSString *locationSelected;
@property float latitude;
@property float longitude;
@end
