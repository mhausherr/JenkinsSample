//
//  JUCEvent.h
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JUCObject.h"

/** The iOS Application for the Jenkins User Conference of Paris.
 
 This is the business object that represent an event
 */

@interface JUCEvent : JUCObject

/**************************************************************************************************/
#pragma mark - Getters & Setters

/** Time of the event */
@property(nonatomic,strong) NSString    *time;
/** Speaker name for the event */
@property(nonatomic,strong) NSString    *speaker;
/** Title of the event */
@property(nonatomic,strong) NSString    *title;
/** Lang of the event (fr & en are supported) */
@property(nonatomic,strong) NSString    *lang;
/** Summary of the event */
@property(nonatomic,strong) NSString    *summary;
/** Array of subevents of the event */
@property(nonatomic,strong) NSArray     *subevents;

@end
