//
//  JUCEventServiceTest.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 04/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCEventServiceTest.h"

/* Services */
#import "JUCEventsService.h"

@interface JUCEventsService ()
+ (NSArray *)parseRoomsFromDictionary:(NSDictionary *)jsonDict;
@end

@implementation JUCEventServiceTest

- (void)setUp
{
    [super setUp];    
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

/**************************************************************************************************/
#pragma mark - (NSArray *)parseRoomsFromDictionary:(NSDictionary *)jsonDict

- (void)test_parseRoomsFromDictionary_returnNilForNilDictionnary
{
    // Given
    NSDictionary *dictionnary = nil;
    
    // When
    NSArray* rooms = [JUCEventsService parseRoomsFromDictionary:dictionnary];
    
    // Then
    STAssertNil(rooms,nil);
}

- (void)test_parseRoomsFromDictionary_returnEmptyArrayForIncorrectDictionnary
{
    // Given
    NSDictionary *dictionnary = [NSDictionary dictionary];
    
    // When
    NSArray* rooms = [JUCEventsService parseRoomsFromDictionary:dictionnary];
    
    // Then
    STAssertTrue([rooms isKindOfClass:[NSArray class]],nil);
    STAssertTrue([rooms count]==0,nil);
}

- (void)test_parseRoomsFromDictionary_returnObjectsArrayForCorrectDictionnary
{
    // Given
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:[NSArray array] forKey:KEY_ROOMS];
    
    // When
    NSArray* rooms = [JUCEventsService parseRoomsFromDictionary:dictionnary];
    
    // Then
    STAssertTrue([rooms isKindOfClass:[NSArray class]],nil);
}


@end
