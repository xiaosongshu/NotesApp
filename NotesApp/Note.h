//
//  Note.h
//  NotesApp
//
//  Created by Kevin Jiang on 3/21/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSString * description2;
@property (nonatomic, retain) Location *location;

@end
