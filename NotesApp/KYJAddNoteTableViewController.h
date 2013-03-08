//
//  KYJAddNoteTableViewController.h
//  NotesApp
//
//  Created by Kevin Jiang on 3/8/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYJNotes.h"

@class KYJAddNoteTableViewController;

@protocol KYJAddNoteTableViewControllerDelegate <NSObject>
- (void)addNoteTableViewController: (KYJAddNoteTableViewController *)controller didAddNote:(KYJNotes *)note;
@end

@interface KYJAddNoteTableViewController : UITableViewController

@property (nonatomic, weak) id <KYJAddNoteTableViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end
