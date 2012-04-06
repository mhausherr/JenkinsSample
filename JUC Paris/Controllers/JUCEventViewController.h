//
//  JUCEventViewController.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import <UIKit/UIKit.h>


/** The iOS Application for the Jenkins User Conference of Paris.
 *
 * This is the view controller that display the detail of an event
 */


@class JUCEvent;

@interface JUCEventViewController : UIViewController

/** Event to display */
@property (strong, nonatomic) JUCEvent              *event;

/** Label that display the time of the session */
@property (weak, nonatomic) IBOutlet UILabel        *timeLabel;
/** ImageView that represent the lang of the session */
@property (weak, nonatomic) IBOutlet UIImageView    *langImage;
/** Label that display the name of the session speaker */
@property (weak, nonatomic) IBOutlet UILabel        *speakerLabel;
/** Label that display the title of the session */
@property (weak, nonatomic) IBOutlet UILabel        *titleLabel;
/** Label that display the summary of the session */
@property (weak, nonatomic) IBOutlet UILabel        *summaryLabel;

@end
