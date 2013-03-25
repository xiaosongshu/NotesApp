//
//  KYJAddNoteTableViewController.m
//  NotesApp
//
//  Created by Kevin Jiang on 3/8/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import "KYJAddNoteTableViewController.h"
#import "Note.h"
#import "Location.h"
#import "KYJTableViewController.h"
#import "KYJFoursquareViewController.h"
#import "KYJDataManager.h"


@interface KYJAddNoteTableViewController () {
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
        
    self.titleTextField.adjustsFontSizeToFitWidth = YES;
    
    self.descriptionTextField.adjustsFontSizeToFitWidth = YES;
    
    // locationManager update as location
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];

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
    CLLocation *location = [locationManager location];
    
    // Configure the new event with information from the location
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    NSNumber *latitude = [NSNumber numberWithFloat:coordinate.latitude];
    NSNumber * longitude = [NSNumber numberWithFloat:coordinate.longitude];
    NSString *locationName = @"";

    
    NSLog(@"Latitude : %@", latitude);
    NSLog(@"Longitude : %@",longitude);
    
    KYJDataManager *datamanager = [[KYJDataManager alloc] init]; //Move this to public variable initialized from controller
    
    if ([self.foursquareLocationName length] != 0){
        latitude = self.foursquareLatitude;
        longitude = self.foursquareLongitude;
        locationName = self.foursquareLocationName;
    }
    
    [datamanager addNoteWithText: self.titleTextField.text description:self.descriptionTextField.text locationName:locationName longitude:longitude latitude:latitude];
    
    [self.delegate addNoteTableViewController:self ];
}

- (BOOL)textFieldShouldReturn:
(UITextField *)textField {
    [self.titleTextField resignFirstResponder];
    [self.descriptionTextField resignFirstResponder];
    return YES;
}

- (IBAction)foursquareLocation:(UIStoryboardSegue *)segue {
    KYJFoursquareViewController *addNoteVC = segue.sourceViewController;
    self.foursquareLatitude = [NSNumber numberWithFloat:addNoteVC.latitude];
    self.foursquareLongitude = [NSNumber numberWithFloat:addNoteVC.longitude];
    self.foursquareLocationName = addNoteVC.locationSelected;
}

@end
