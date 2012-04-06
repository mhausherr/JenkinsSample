//
//  JUCEventTests.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCEventTests.h"

/* Model */
#import "JUCEvent.h"

@implementation JUCEventTests

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
    NSString *key = @"time";
    id value = @"value";
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertTrue([value isEqualToString:event.time],nil);
}

- (void)test_objectWithDictionary_returnObjectForIncorrectNameKeyDictionnary
{
    // Given
    NSString *key = @"time";
    id value = [[NSObject alloc] init];
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertNil(event.time,nil);
}

- (void)test_objectWithDictionary_returnCorrectObjectForSpeakerKeyDictionnary
{
    // Given
    NSString *key = @"speaker";
    id value = @"value";
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertTrue([value isEqualToString:event.speaker],nil);
}

- (void)test_objectWithDictionary_returnObjectForIncorrectSpeakerKeyDictionnary
{
    // Given
    NSString *key = @"speaker";
    id value = [[NSObject alloc] init];
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertNil(event.speaker,nil);
}

- (void)test_objectWithDictionary_returnCorrectObjectForTitleKeyDictionnary
{
    // Given
    NSString *key = @"title";
    id value = @"value";
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertTrue([value isEqualToString:event.title],nil);
}

- (void)test_objectWithDictionary_returnObjectForIncorrectTitleKeyDictionnary
{
    // Given
    NSString *key = @"title";
    id value = [[NSObject alloc] init];
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertNil(event.title,nil);
}

- (void)test_objectWithDictionary_returnCorrectObjectForLangKeyDictionnary
{
    // Given
    NSString *key = @"lang";
    id value = @"value";
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertTrue([value isEqualToString:event.lang],nil);
}

- (void)test_objectWithDictionary_returnObjectForIncorrectLangKeyDictionnary
{
    // Given
    NSString *key = @"lang";
    id value = [[NSObject alloc] init];
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertNil(event.lang,nil);
}

- (void)test_objectWithDictionary_returnCorrectObjectForSummaryKeyDictionnary
{
    // Given
    NSString *key = @"summary";
    id value = @"value";
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertTrue([value isEqualToString:event.summary],nil);
}

- (void)test_objectWithDictionary_returnObjectForIncorrectSummaryKeyDictionnary
{
    // Given
    NSString *key = @"summary";
    id value = [[NSObject alloc] init];
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertNil(event.summary,nil);
}

- (void)test_objectWithDictionary_returnCorrectObjectForSubeventsKeyDictionnary
{
    // Given
    NSString *key = @"subevents";
    id value = [NSArray arrayWithObject:[NSDictionary dictionary]];
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertTrue([event.subevents count] > 0,nil);
    STAssertTrue([[event.subevents objectAtIndex:0] isKindOfClass:[JUCEvent class]],nil);
}

- (void)test_objectWithDictionary_returnObjectForIncorrectSubeventsKeyDictionnary
{
    // Given
    NSString *key = @"subevents";
    id value = [[NSObject alloc] init];
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCEvent* event = [JUCEvent objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([event isKindOfClass:[JUCEvent class]],nil);
    STAssertNil(event.subevents,nil);
}

@end
