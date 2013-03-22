//
//  KYJAddNoteTableViewController.h
//  NotesApp
//
//  Created by Kevin Jiang on 3/8/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Note.h"

@class KYJAddNoteTableViewController;

@protocol KYJAddNoteTableViewControllerDelegate <NSObject>
- (void)addNoteTableViewController: (KYJAddNoteTableViewController *)controller;
@end

@interface KYJAddNoteTableViewController : UITableViewController <CLLocationManagerDelegate>{
    CLLocationManager *locationManager;

}

@property (nonatomic, retain) CLLocationManager *locationManager;

@property (nonatomic, weak) id <KYJAddNoteTableViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end

