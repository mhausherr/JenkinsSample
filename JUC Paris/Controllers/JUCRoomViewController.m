//
//  JUCRoomViewController.h
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCRoomViewController.h"

/* Model */
#import "JUCEvent.h"

/* Controllers */
#import "JUCEventViewController.h"

@interface JUCRoomViewController ()
- (void)configureView;
@end

@implementation JUCRoomViewController

/**************************************************************************************************/
#pragma mark - Getters & Setters

@synthesize events=_events;

- (void)setEvents:(NSArray *)events
{
    if (_events != events) {
        _events = events;
        
        // Update the view.
        [self configureView];
    }
}


/**************************************************************************************************/
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
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
    
    if (self.events) {
        [self.tableView reloadData];
    }
}

/**************************************************************************************************/
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"SelectEvent"])
	{
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        JUCEvent *event = [self eventAtIndexPath:indexPath];
        
		JUCEventViewController *eventViewController = segue.destinationViewController;
		eventViewController.event = event;
	}
    else if ([segue.identifier isEqualToString:@"SelectComplexEvent"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        JUCEvent *event = [self eventAtIndexPath:indexPath];
        
		JUCRoomViewController *roomViewController = segue.destinationViewController;
		roomViewController.events = event.subevents;
    }
}


/**************************************************************************************************/
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [self.events count];
        default:
            return 0;
    }
}

- (JUCEvent *)eventAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return [self.events objectAtIndex:indexPath.row];
        default:
            return nil;
    } 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JUCEvent *event = [self eventAtIndexPath:indexPath];
    UITableViewCell *cell;
    if (event.subevents) {
        static NSString *CellIdentifier = @"ComplexEventCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    else {
        static NSString *CellIdentifier = @"EventCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];  
    }
    
    cell.textLabel.text = event.time;
    cell.detailTextLabel.text = event.title;
    
    return cell;
}

@end
