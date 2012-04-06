//
//  JUCRoom.h
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JUCObject.h"

/** The iOS Application for the Jenkins User Conference of Paris.

This is the business object that represent a room
*/

@interface JUCRoom : JUCObject

/**************************************************************************************************/
#pragma mark - Getters & Setters

/** Name of the room */
@property(nonatomic,strong) NSString    *name;
/** Array of events in the room */
@property(nonatomic,strong) NSArray     *events;

@end
