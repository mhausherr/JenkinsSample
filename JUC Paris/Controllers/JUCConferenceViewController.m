//
//  JUCRoom.h
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCConferenceViewController.h"

/* Services */
#import "JUCEventsService.h"

/* Model */
#import "JUCRoom.h"

/* Controllers */
#import "JUCRoomViewController.h"

@implementation JUCConferenceViewController

/**************************************************************************************************/
#pragma mark - Getters & Setters

@synthesize rooms=_rooms;

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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [JUCEventsService getRoomsWithSuccess:^(AFHTTPRequestOperation *request, NSArray *rooms) {
        self.rooms = rooms;
        [self.tableView reloadData];
    }
                                   failure:^(AFHTTPRequestOperation *request, NSError *error) {
                                       DLog(@"Request fail %@",error);
                                   }];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/**************************************************************************************************/
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"SelectRoom"])
	{
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        JUCRoom *room = [self roomAtIndexPath:indexPath];
        
		JUCRoomViewController *roomViewController = segue.destinationViewController;
		roomViewController.events = room.events;
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
            return [self.rooms count];
        default:
            return 0;
    }
}

- (JUCRoom *)roomAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            if([self.rooms count]>indexPath.row) {
                return [self.rooms objectAtIndex:indexPath.row];
            }
            else {
                return nil;
            }
        default:
            return nil;
    } 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RoomCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    JUCRoom *room = [self roomAtIndexPath:indexPath];
    cell.textLabel.text = room.name;
    
    return cell;
}

@end
