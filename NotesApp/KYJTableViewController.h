//
//  KYJTableViewController.h
//  NotesApp
//
//  Created by Kevin Jiang on 3/3/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYJDetailViewController.h"

@interface KYJTableViewController : UITableViewController <KYJDetailViewControllerDelegate>

@property (nonatomic, strong) NSArray *notes;
@property (nonatomic, strong) IBOutlet UITableView *tableView;



@end