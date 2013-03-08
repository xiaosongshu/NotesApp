//
//  KYJAddNoteTableViewController.m
//  NotesApp
//
//  Created by Kevin Jiang on 3/8/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import "KYJAddNoteTableViewController.h"
#import "KYJNotes.h"
#import "KYJTableViewController.h"

@interface KYJAddNoteTableViewController ()

@end

@implementation KYJAddNoteTableViewController

@synthesize delegate;

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
    
    self.titleTextField.adjustsFontSizeToFitWidth = YES;
    
    self.descriptionTextField.adjustsFontSizeToFitWidth = YES;


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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

- (IBAction)cancel:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)done:(id)sender
{
    KYJNotes *note = [[KYJNotes alloc] init];
	note.title = self.titleTextField.text;
	note.description = self.descriptionTextField.text;
    [self.delegate addNoteTableViewController:self didAddNote:note];
}

@end
