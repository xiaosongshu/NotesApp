//
//  KYJTableViewController.h
//  NotesApp
//
//  Created by Kevin Jiang on 3/3/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYJDetailViewController.h"
#import "KYJDataManager.h"


@interface KYJTableViewController : UITableViewController <KYJDetailViewControllerDelegate,NSFetchedResultsControllerDelegate> {

NSFetchedResultsController *fetchedResultsController;
NSManagedObjectContext *managedObjectContext;
}

@property (nonatomic, strong) NSArray *notes;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,strong) KYJDataManager *datamanager;





@end