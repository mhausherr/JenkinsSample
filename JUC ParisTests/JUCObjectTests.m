//
//  JUCObjectTests.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCObjectTests.h"
/* Model */
#import "JUCRoom.h"
#import "JUCEvent.h"

@implementation JUCObjectTests

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

- (void)test_objectWithDictionary_returnNilForNilDictionnary
{
    // Given
    NSDictionary *dictionnary = nil;
    
    // When
    JUCObject* object = [JUCObject objectWithDictionary:dictionnary];
    
    // Then
    STAssertNil(object,nil);
}

- (void)test_objectWithDictionary_returnObjectForIncorrectKeyDictionnary
{
    // Given
    NSString *key = @"uncorrectKey";
    id value = @"value";
    NSDictionary *dictionnary = [NSDictionary dictionaryWithObject:value forKey:key];
    
    // When
    JUCObject* object = [JUCObject objectWithDictionary:dictionnary];
    
    // Then
    STAssertTrue([object isKindOfClass:[JUCObject class]],nil);
}

@end
