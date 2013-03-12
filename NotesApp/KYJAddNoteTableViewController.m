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
#import "KYJFoursquareViewController.h"

@interface KYJAddNoteTableViewController () {
    KYJNotes *note;
}

@end

@implementation KYJAddNoteTableViewController

@synthesize delegate;
@synthesize locationManager;

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
        
    note = [[KYJNotes alloc] init];

    self.titleTextField.adjustsFontSizeToFitWidth = YES;
    
    self.descriptionTextField.adjustsFontSizeToFitWidth = YES;
    
    // locationManager update as location
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    
    CLLocation *location = [locationManager location];
    
    // Configure the new event with information from the location
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    NSString *latitude = [NSString stringWithFormat:@"%f", coordinate.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f", coordinate.longitude];
    
    NSLog(@"dLatitude : %@", latitude);
    NSLog(@"dLongitude : %@",longitude);
    
    // Add location data (where Note was saved) to Note
    note.latitude = coordinate.latitude;
    note.longitude = coordinate.longitude;
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
	note.title = self.titleTextField.text;
	note.description = self.descriptionTextField.text;
    [self.delegate addNoteTableViewController:self didAddNote:note];
}

- (BOOL)textFieldShouldReturn:
(UITextField *)textField {
    [self.titleTextField resignFirstResponder];
    [self.descriptionTextField resignFirstResponder];
    return YES;
}

//- (IBAction)passFoursquare:(UIStoryboardSegue *)segue {
//      KYJFoursquareViewController *foursquareVC = segue.sourceViewController;
//      note.latitude = foursquareVC.latitude;
//      note.longitude = foursquareVC.longitude;
//    
////    KYJNotes *updatedNote = [[KYJNotes alloc] init];
////    updatedNote.title = detailVC.titleName;
////    updatedNote.description = detailVC.descriptionName;
////    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
////    [self.notes replaceObjectAtIndex:indexPath.row withObject:updatedNote];
////    [tableView reloadData];
//}

- (IBAction)foursquareLocation:(UIStoryboardSegue *)segue {
    KYJFoursquareViewController *addNoteVC = segue.sourceViewController;
    note.latitude = addNoteVC.latitude;
    note.longitude = addNoteVC.longitude;
    note.locationName = addNoteVC.locationSelected;
}

@end
