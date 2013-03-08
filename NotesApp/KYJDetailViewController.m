//
//  KYJDetailViewController.m
//  NotesApp
//
//  Created by Kevin Jiang on 3/7/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import "KYJDetailViewController.h"
#import "KYJNotes.h"

@interface KYJDetailViewController ()


@end

@implementation KYJDetailViewController {
}

@synthesize note;
@synthesize titleLabel;
@synthesize descriptionLabel;

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
    descriptionLabel.text = note.description;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
