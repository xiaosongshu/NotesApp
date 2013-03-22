//
//  KYJDetailViewController.m
//  NotesApp
//
//  Created by Kevin Jiang on 3/7/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import "KYJDetailViewController.h"
#import "Note.h"
#import "Location.h"
#import "KYJTableViewController.h"

#define METERS_PER_MILE 1609.344


@interface KYJDetailViewController ()
@end

@implementation KYJDetailViewController {
}

@synthesize delegate;
@synthesize note;
@synthesize titleLabel;
@synthesize descriptionLabel;
@synthesize locationLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // note = [[KYJNotes alloc] init];
    titleLabel.text = note.title;
    descriptionLabel.text = note.description2;
    locationLabel.text = note.locationName;
    self.latitude = note.location.latitude;
    self.longitude = note.location.longitude;
    
}

// viewDidAppear to fix problem not updating on first try
- (void)viewDidAppear:(BOOL)animated {
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = [note.location.latitude floatValue];
    zoomLocation.longitude= [note.location.longitude floatValue];
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 2*METERS_PER_MILE, 2*METERS_PER_MILE);
    
    // 3
    [self.mapView setRegion:viewRegion animated:YES];
    
    
    // 4
    CLLocation *location = [[CLLocation alloc] initWithLatitude: zoomLocation.latitude longitude: zoomLocation.longitude];
    [self addPinToMatAtLocation: location];
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//add helper method
- (void)addPinToMatAtLocation:(CLLocation *)location
{
    //red pin on map
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = location.coordinate;
    pin.title = @"You Left the Note Here!";
    [self.mapView addAnnotation:pin];
}

- (BOOL)textFieldShouldReturn:
(UITextField *)textField {
    [self.titleLabel resignFirstResponder];
    [self.descriptionLabel resignFirstResponder];
    [self.locationLabel resignFirstResponder];
    return YES;
}

//- (IBAction)updateNote:(id)sender {
//    KYJNotes *newNote = [[KYJNotes alloc] init];
//    newNote.title = self.titleLabel.text;
//    newNote.description = self.descriptionLabel.text;
//    NSLog(@"delegate = %@", self.delegate);
//    [self.delegate detailViewControllerDidFinish:self didUpdateNote:newNote];
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"updateNoteSegue"]) {
        //self.updatedNote.description = self.descriptionLabel.text;
        //self.updatedNote.title = self.titleLabel.text;
        self.titleName = self.titleLabel.text;
        self.descriptionName = self.descriptionLabel.text;
        self.locationName = self.locationLabel.text;
        
//        self.updatedNote.title = self.titleLabel.text;
//        self.updatedNote.description = self.descriptionLabel.text;
//        self.updatedNote.locationName = self.locationLabel.text;
    }
}

@end
