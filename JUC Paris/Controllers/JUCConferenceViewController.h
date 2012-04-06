//
//  JUCRoom.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import <UIKit/UIKit.h>


/** The iOS Application for the Jenkins User Conference of Paris.
 *
 * This is the view controller that display all rooms of a conforence
 */


@class JUCRoom;

@interface JUCConferenceViewController : UITableViewController

/** Rooms to display */
@property(nonatomic, strong) NSArray* rooms;

/**************************************************************************************************/
#pragma mark - Data Source


/**
 * Get JUCRoom business object represented in the cell at indexpath
 * @param indexPath indexPath of the cell
 * @return Returns room to display.
 * @see JUCRoom
 */
- (JUCRoom *)roomAtIndexPath:(NSIndexPath *)indexPath;

@end
