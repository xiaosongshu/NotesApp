//
//  KYJTableViewController.m
//  NotesApp
//
//  Created by Kevin Jiang on 3/3/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import "KYJTableViewController.h"
#import "KYJNotes.h"
#import "KYJDetailViewController.h"
#import "KYJAddNoteTableViewController.h"
#import "KYJDataManager.h"

#define kKYJCellIdentifier @"My Cell Identifier"

@interface KYJTableViewController ()

@end

@implementation KYJTableViewController {
}

@synthesize notes;
@synthesize tableView;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    notes = [NSMutableArray arrayWithCapacity:20];
	KYJNotes *note = [[KYJNotes alloc] init];
    note.title = @"Title 1";
    note.description = @"Description 1 - @Boston";
    note.latitude = 39.281516;
    note.longitude = -76.580806;
    note.locationName = @"Boston";
    [notes addObject:note];
    note = [[KYJNotes alloc] init];
    note.title = @"Title 2";
    note.description = @"Description 2 - @London";
    note.latitude = 51.5081289;
    note.longitude = -0.128005;
    note.locationName = @"London";
    [notes addObject:note];
    note = [[KYJNotes alloc] init];
    note.title = @"Title 3";
    note.description = @"Description 3 - @New York";
    note.latitude = 40.7167;
    note.longitude = -74;
    note.locationName = @"New York";
    [notes addObject:note]; 
    
    KYJDataManager *datamanager = [[KYJDataManager alloc] init];
    [notes addObjectsFromArray:[datamanager getAllIdeas]];
    [super viewDidLoad];
    NSLog(@"viewDidAppear");
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
    KYJNotes *note = [self.notes objectAtIndex:indexPath.row];
	cell.textLabel.text = note.title;
	cell.detailTextLabel.text = note.description;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
                       didAddNote:(KYJNotes *)note
{
	[self.notes addObject:note];
	NSIndexPath *indexPath =
    [NSIndexPath indexPathForRow:[self.notes count] - 1
                       inSection:0];
	[self.tableView insertRowsAtIndexPaths:
     [NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)updateNote:(UIStoryboardSegue *)segue {
    KYJDetailViewController *detailVC = segue.sourceViewController;
    KYJNotes *updatedNote = [[KYJNotes alloc] init];
    updatedNote.title = detailVC.titleName;
    updatedNote.description = detailVC.descriptionName;
    updatedNote.locationName = detailVC.locationName;
    updatedNote.latitude = detailVC.latitude;
    updatedNote.longitude = detailVC.longitude;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    [self.notes replaceObjectAtIndex:indexPath.row withObject:updatedNote];
    [tableView reloadData];
}


@end
