//
//  KYJTableViewController.m
//  NotesApp
//
//  Created by Kevin Jiang on 3/3/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import "KYJTableViewController.h"
#import "Note.h"
#import "Location.h"
#import "KYJDetailViewController.h"
#import "KYJAddNoteTableViewController.h"
#import <CoreData/CoreData.h>


#define kKYJCellIdentifier @"My Cell Identifier"
#define kKYJNoteEntityName @"Note"
#define kKYJLocationEntityName @"Location"
#define kKYJSaveError @"Whoops, couldn't save: %@"


@interface KYJTableViewController ()
@end

@implementation KYJTableViewController

@synthesize notes;
@synthesize tableView;
@synthesize managedObjectContext;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    notes = [NSMutableArray arrayWithCapacity:20];
    
    self.datamanager = [[KYJDataManager alloc] init];
    notes = [self.datamanager getAllIdeas];
     NSLog(@"viewDidAppear");
    
    self.managedObjectContext = [self managedObjectContext];
    
    if(self.managedObjectContext == nil)
    {
        self.managedObjectContext = [self.datamanager managedObjectContext];
    }
    
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kKYJCellIdentifier];
    Note *note = [self.notes objectAtIndex:indexPath.row];
	cell.textLabel.text = note.title;
	cell.detailTextLabel.text = note.description2;
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showNoteDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KYJDetailViewController *destViewController = segue.destinationViewController;
        destViewController.note = [notes objectAtIndex:indexPath.row];
    }
    if ([segue.identifier isEqualToString:@"addNote"]) {
		UINavigationController *navigationController = segue.destinationViewController;
		KYJAddNoteTableViewController *addNoteViewController = [[navigationController viewControllers]
                                                                objectAtIndex:0];
		addNoteViewController.delegate = self;
    }
}

- (void)addNoteTableViewController:
(KYJAddNoteTableViewController *)controller
{
    self.notes = [self.datamanager getAllIdeas];
	[tableView reloadData];
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)updateNote:(UIStoryboardSegue *)segue {
    KYJDetailViewController *detailVC = segue.sourceViewController;
    
    KYJDataManager *datamanager = [[KYJDataManager alloc] init]; //Move this to public variable initialized from controller
    
    [datamanager updateIdea:detailVC.note withText:detailVC.titleName description:detailVC.descriptionName locationName:detailVC.locationName longitude:detailVC.longitude latitude:detailVC.latitude];
        
    self.notes = [self.datamanager getAllIdeas];
    [tableView reloadData];
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(kKYJSaveError, [error localizedDescription]);
    }

}


@end
