//
//  JUCRoom.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCRoom.h"
#import "JUCEvent.h"

/* Utils */
#import "NSString+Indentation.h"

/* Errors */
#define ROOM_ERROR_DOMAIN @"com.mathieu-hausherr.juc.room"
#define ROOM_INVALID_NAME_CODE 1 
#define ROOM_INVALID_EVENT_CODE 2 

@implementation JUCRoom

/**************************************************************************************************/
#pragma mark - Geters & Setters

@synthesize name;
@synthesize events=_events;

- (void)setEvents:(NSArray *)events
{
    NSMutableArray *eventsArray = [NSMutableArray arrayWithCapacity:[events count]];
    for (NSDictionary *eventData in events) {
        [eventsArray addObject:[JUCEvent objectWithDictionary:eventData]];
    }
    _events = [NSArray arrayWithArray:eventsArray];
}

/**************************************************************************************************/
#pragma mark - Validation

-(BOOL)validateName:(id *)ioValue error:(NSError **)outError {
    // The name must not be nil, and must be a string.
    BOOL isNil = *ioValue == nil;
    BOOL isString = !isNil&&[*ioValue isKindOfClass:[NSString class]];
    if (isNil || !isString)
    {
        if (outError != NULL)
        {
            NSString *errorString = @"name missformated";
            
            NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
                                                                     forKey:NSLocalizedDescriptionKey];
            *outError = [[NSError alloc] initWithDomain:ROOM_ERROR_DOMAIN
                                                   code:ROOM_INVALID_NAME_CODE
                                               userInfo:userInfoDict];
        }
        return NO;
    }
    return YES;
}

-(BOOL)validateEvents:(id *)ioValue error:(NSError **)outError {
    // The events must not be an array, and have at least 1 element.
    BOOL isNil = *ioValue == nil;
    BOOL isArray = !isNil&&[*ioValue isKindOfClass:[NSArray class]];
    BOOL isEmpty = isArray&&([(NSArray*)*ioValue count] < 1);
    if (isNil || !isArray || isEmpty)
    {
        if (outError != NULL)
        {
            NSString *errorString = @"event missformated";
            
            NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
                                                                     forKey:NSLocalizedDescriptionKey];
            *outError = [[NSError alloc] initWithDomain:ROOM_ERROR_DOMAIN
                                                   code:ROOM_INVALID_EVENT_CODE
                                               userInfo:userInfoDict];
        }
        return NO;
    }
    return YES;
}

/**************************************************************************************************/
#pragma mark - Utils

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: %p>:",[self class],self];
    [description appendFormat:@"name: %@",self.name];
    [description appendString:@"events: {\n"];
    for (JUCEvent *event in self.events) {
        [description appendFormat:@"%@\n",[[event description] stringWithIndentation]];
    }
    [description appendString:@"}\n"];
    return description;
}

@end
