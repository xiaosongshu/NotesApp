//
//  KYJDetailViewController.h
//  NotesApp
//
//  Created by Kevin Jiang on 3/7/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import <MapKit/MapKit.h>

@class KYJDetailViewController;

@protocol KYJDetailViewControllerDelegate <NSObject>
- (void)detailViewControllerDidFinish:(KYJDetailViewController*)controller didUpdateNote:(Note *)updatedNote;
@end

@interface KYJDetailViewController : UIViewController;

@property (nonatomic, weak) id <KYJDetailViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (strong, nonatomic) NSString *titleName;

@property (weak, nonatomic) IBOutlet UITextField *descriptionLabel;
@property (strong, nonatomic) NSString *descriptionName;

@property (weak, nonatomic) IBOutlet UITextField *locationLabel;
@property (strong, nonatomic) NSString *locationName;

@property (strong, nonatomic) Note *note;
@property (strong, nonatomic) Note *updatedNote;

@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end



