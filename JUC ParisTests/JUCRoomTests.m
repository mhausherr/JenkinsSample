//
//  JUCRoomTests.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCRoomTests.h"

/* Model */
#import "JUCRoom.h"
#import "JUCEvent.h"

@implementation JUCRoomTests

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
#pragma mark - (id)objectWithDictionary:(NSDictionary *)dictionary

- (void)test_objectWithDictionary_returnCorrectObjectForNameKeyDictionnary
{
    // Given
    NSString *key = @"name";
    id value = @"value";
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCRoom* room = [JUCRoom objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([room isKindOfClass:[JUCRoom class]],nil);
    STAssertTrue([value isEqualToString:room.name],nil);
}

- (void)test_objectWithDictionary_returnObjectForIncorrectNameKeyDictionnary
{
    // Given
    NSString *key = @"name";
    id value = [[NSObject alloc] init];
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCRoom* room = [JUCRoom objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([room isKindOfClass:[JUCRoom class]],nil);
    STAssertNil(room.name,nil);
}

- (void)test_objectWithDictionary_returnCorrectObjectForEventsKeyDictionnary
{
    // Given
    NSString *key = @"events";
    id value = [NSArray arrayWithObject:[NSDictionary dictionary]];
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCRoom* room = [JUCRoom objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([room isKindOfClass:[JUCRoom class]],nil);
    STAssertTrue([room.events count] > 0,nil);
    STAssertTrue([[room.events objectAtIndex:0] isKindOfClass:[JUCEvent class]],nil);
}

- (void)test_objectWithDictionary_returnObjectForIncorrectEventsKeyDictionnary
{
    // Given
    NSString *key = @"events";
    id value = [[NSObject alloc] init];
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCRoom* room = [JUCRoom objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([room isKindOfClass:[JUCRoom class]],nil);
    STAssertNil(room.name,nil);
}

@end
