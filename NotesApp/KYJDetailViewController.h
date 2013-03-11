//
//  KYJDetailViewController.h
//  NotesApp
//
//  Created by Kevin Jiang on 3/7/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYJNotes.h"
#import <MapKit/MapKit.h>

@class KYJDetailViewController;

@protocol KYJDetailViewControllerDelegate <NSObject>
- (void)detailViewControllerDidFinish:(KYJDetailViewController*)controller didUpdateNote:(KYJNotes *)updatedNote;
@end

@interface KYJDetailViewController : UIViewController <CLLocationManagerDelegate>;

@property (nonatomic, weak) id <KYJDetailViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (strong, nonatomic) NSString *titleName;

@property (weak, nonatomic) IBOutlet UITextField *descriptionLabel;
@property (strong, nonatomic) NSString *descriptionName;


@property (strong, nonatomic) KYJNotes *note;
@property (strong, nonatomic) KYJNotes *updatedNote;


@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end



