//
//  KYJDataManager.h
//  NotesApp
//
//  Created by Kevin Jiang on 2/28/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@class KYJNote;
@interface KYJDataManager : NSObject <UIApplicationDelegate> {
}

- (BOOL)addNoteWithText:(NSString *)title
            description:(NSString *)description
           locationName:(NSString *)locationName
              longitude: (NSNumber *) longitude
               latitude: (NSNumber *) latitude;

- (BOOL)updateIdea:(Note *)note withText:(NSString *)title description:(NSString *)description locationName:(NSString *)locationName
         longitude:(NSNumber*)longitude latitude:(NSNumber*)latitude;

- (NSArray *)getAllIdeas;

- (NSManagedObjectContext *)managedObjectContext;



@end
