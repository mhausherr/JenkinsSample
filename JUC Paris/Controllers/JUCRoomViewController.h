//
//  JUCRoomViewController.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import <UIKit/UIKit.h>


/** The iOS Application for the Jenkins User Conference of Paris.
 *
 * This is the view controller that display all events of a room or all subevents of an event
 */


@class JUCEvent;

@interface JUCRoomViewController : UITableViewController

/** Events to display */
@property(nonatomic,strong) NSArray* events;

/**************************************************************************************************/
#pragma mark - Data Source

/**
 * Get JUCEvent business object represented in the cell at indexpath
 * @param indexPath indexPath of the cell
 * @return Returns event to display.
 * @see JUCEvent
 */
- (JUCEvent *)eventAtIndexPath:(NSIndexPath *)indexPath;

@end
