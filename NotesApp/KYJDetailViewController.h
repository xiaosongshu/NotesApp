//
//  KYJDetailViewController.h
//  NotesApp
//
//  Created by Kevin Jiang on 3/7/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYJNotes.h"

@interface KYJDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleLabel;

@property (weak, nonatomic) IBOutlet UITextField *descriptionLabel;

@property (strong, nonatomic) KYJNotes *note;

@end
