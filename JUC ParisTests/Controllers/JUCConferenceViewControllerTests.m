//
//  JUCConferenceViewControllerTests.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 02/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCConferenceViewControllerTests.h"

/* Controllers */
#import "JUCConferenceViewController.h"

/* Model */
#import "JUCRoom.h"

@implementation JUCConferenceViewControllerTests

- (void)setUp
{
    [super setUp];
    
    controller = [[JUCConferenceViewController alloc] initWithNibName:nil bundle:nil];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

/**************************************************************************************************/
#pragma mark - (JUCRoom *)roomAtIndexPath:(NSIndexPath *)indexPath;

- (void)test_roomAtIndexPath_nilCellReturnWhenNoData
{
    // Given
    controller.rooms = nil;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    // When
    JUCRoom *room = [controller roomAtIndexPath:indexPath];
    
    // Then
    STAssertNil(room,nil);
}

- (void)test_roomAtIndexPath_nilCellReturnWhenWrongIndex
{
    // Given
    controller.rooms = [NSArray arrayWithObject:[[JUCRoom alloc] init]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    
    // When
    JUCRoom *room = [controller roomAtIndexPath:indexPath];
    
    // Then
    STAssertNil(room,nil);
}

- (void)test_roomAtIndexPath_CorrectCellReturnWhenCorrectIndex
{
    // Given
    controller.rooms = [NSArray arrayWithObject:[[NSObject alloc] init]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    // When
    JUCRoom *room = [controller roomAtIndexPath:indexPath];
    
    // Then
    STAssertNotNil(room,nil);
}

@end