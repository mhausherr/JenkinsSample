//
//  JUCEventViewController.h
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCEventViewController.h"

/* Model */
#import "JUCEvent.h"

/* Utils */
#import "UILabel+AutosizeHeight.h"

@interface JUCEventViewController ()
- (void)configureView;
@end

@implementation JUCEventViewController

/**************************************************************************************************/
#pragma mark - Getters & Setters

@synthesize event = _event;

- (void)setEvent:(JUCEvent *)event
{
    if (_event != event) {
        _event = event;
        
        // Update the view.
        [self configureView];
    }
}

@synthesize timeLabel = _timeLabel;
@synthesize langImage = _langImage;
@synthesize speakerLabel = _speakerLabel;
@synthesize titleLabel = _titleLabel;
@synthesize summaryLabel = _summaryLabel;

/**************************************************************************************************/
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setTimeLabel:nil];
    [self setLangImage:nil];
    [self setSpeakerLabel:nil];
    [self setTitleLabel:nil];
    [self setSummaryLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.event) {
        self.title = self.event.title;
        self.timeLabel.text = self.event.time;
        self.langImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",self.event.lang]];
        self.speakerLabel.text = self.event.speaker;
        self.titleLabel.text = self.event.title;
        self.summaryLabel.text = self.event.summary;
        [self.summaryLabel setHeightForCurrentTextWithMargin:0.0];
    }
}

@end
