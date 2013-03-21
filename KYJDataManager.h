//
//  KYJDataManager.h
//  NotesApp
//
//  Created by Kevin Jiang on 2/28/13.
//  Copyright (c) 2013 Kevin Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KYJNote;
@interface KYJDataManager : NSObject

- (BOOL)addNoteWithText:(NSString *)title
            description:(NSString *)description
           locationName:(NSString *)locationName
              longitude: (float) longitude
               latitude: (float) latitude;

- (NSArray *)getAllIdeas;

@end
