//
//  KYJFoursquareViewController.m
//  OurFirstTableViewApp
//
//  Created by Ayaka Nonaka on 2/25/13.
//  Copyright (c) 2013 Ayaka Nonaka. All rights reserved.
//

#import "KYJFoursquareViewController.h"
#import "Note.h"
#import "KYJAddNoteTableViewController.h"

#define kAYKCellIdentifier @"My Cell Identifier"
#define kAYKFoursquareURL @"https://api.foursquare.com/v2/venues/search?ll=39.955379,-75.196931&client_id=IRY3KR2VKWYMPM5IU2X25LH5MNTMBI5LLE1CS5PU4KU2LJVG&client_secret=NEXT1MRZFV2DERTXNAMXHGNWFAT1MT2HMW4HF4E3Q3BXQI2G&v=20130312"

@interface KYJFoursquareViewController ()
@property (strong, nonatomic) NSArray *locations;
@property (strong, nonatomic) NSArray *lats;
@property (strong, nonatomic) NSArray *longs;
@property (strong, nonatomic) NSMutableData *data;


@end



@implementation KYJFoursquareViewController

@synthesize delegate;

- (void)viewDidLoad
{
    // Make HTTP request.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kAYKFoursquareURL]];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.locations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kAYKCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kAYKCellIdentifier];
    }
    
    cell.textLabel.text = self.locations[indexPath.row][@"name"];
    return cell;
}

#pragma mark - NSURLConnectionDataDelegate Methods

/**
 * Here are the NSURLConnectionDataDelegate methods that handle the callbacks.
 * This is mostly primarily and three step process, assuming you get no errors.
 *
 * 1. You receive a response.
 * 2. You receive any number of pieces of data.
 * 3. The connection finishes loading. That is, you are ready to use the combined pieces of data.
 */

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // Please do something sensible here, like log the error and display an error message.
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary *foursquareResponse = [NSJSONSerialization JSONObjectWithData:_data options:0 error:nil];
    self.locations = foursquareResponse[@"response"][@"venues"];
    self.lats = foursquareResponse[@"response"][@"lat"];
    self.longs = foursquareResponse[@"response"][@"lng"];
    [self.tableView reloadData];
    //NSLog(@"%@", foursquareResponse); // If you want to see what the 4SQ response looks like.
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
//    KYJNotes *passedNote = [[KYJNotes alloc] init];
//    self.locationSelected = self.locations[indexPath.row][@"name"];
//    self.latitude = [self.locations[indexPath.row][@"location"][@"lat"] floatValue];
//    self.longitude = [self.locations[indexPath.row][@"location"][@"lng"] floatValue];
//    passedNote.latitude = self.latitude;
//    passedNote.longitude = self.longitude;
    
//    [self.delegate foursquareTableViewController:self foursquareNote: passedNote];
//    NSLog(@"name = %@, lat = %f, long = %f",self.locationSelected, self.latitude, self.longitude);
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"foursquareSegue"]) {
        
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            //NSUInteger row = [indexPath row];
            self.locationSelected = self.locations[indexPath.row][@"name"];
            self.latitude = [self.locations[indexPath.row][@"location"][@"lat"] floatValue];
            self.longitude = [self.locations[indexPath.row][@"location"][@"lng"] floatValue];
            NSLog(@"name = %@, lat = %f, long = %f",self.locationSelected, self.latitude, self.longitude);
    }
}



@end