//
//  JUCEvent.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCEvent.h"

// Utils
#import "NSString+Indentation.h"

// Errors
#define EVENT_ERROR_DOMAIN @"com.mathieu-hausherr.juc.event"

#define EVENT_INVALID_TIME_CODE 1 
#define EVENT_INVALID_SPEAKER_CODE 2
#define EVENT_INVALID_TITLE_CODE 3
#define EVENT_INVALID_LANG_CODE 4
#define EVENT_INVALID_SUMMARY_CODE 5
#define EVENT_INVALID_SUBEVENTS_CODE 6

@implementation JUCEvent

/**************************************************************************************************/
#pragma mark - Getters & Setters

@synthesize time;
@synthesize speaker;
@synthesize title;
@synthesize lang;
@synthesize summary;
@synthesize subevents=_subevents;

- (void)setSubevents:(NSArray *)subevents
{
    NSMutableArray *subeventsArray = [NSMutableArray arrayWithCapacity:[subevents count]];
    for (NSDictionary *eventData in subevents) {
        [subeventsArray addObject:[JUCEvent objectWithDictionary:eventData]];
    }
    _subevents = [NSArray arrayWithArray:subeventsArray];
}

/**************************************************************************************************/
#pragma mark - Validation

-(BOOL)validateTime:(id *)ioValue error:(NSError **)outError {
    // The time must not be nil, and must be a string.
    BOOL isNil = *ioValue == nil;
    BOOL isString = !isNil&&[*ioValue isKindOfClass:[NSString class]];
    if (isNil || !isString)
    {
        if (outError != NULL)
        {
            NSString *errorString = @"time missformated";
                            
            NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
                                                                     forKey:NSLocalizedDescriptionKey];
            *outError = [[NSError alloc] initWithDomain:EVENT_ERROR_DOMAIN
                                                    code:EVENT_INVALID_TIME_CODE
                                                userInfo:userInfoDict];
        }
        return NO;
    }
    return YES;
}

-(BOOL)validateSpeaker:(id *)ioValue error:(NSError **)outError {
    // The speaker must not be nil, and must be a string.
    BOOL isNil = *ioValue == nil;
    BOOL isString = !isNil&&[*ioValue isKindOfClass:[NSString class]];
    if (isNil || !isString)
    {
        if (outError != NULL)
        {
            NSString *errorString = @"speaker missformated";
            
            NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
                                                                     forKey:NSLocalizedDescriptionKey];
            *outError = [[NSError alloc] initWithDomain:EVENT_ERROR_DOMAIN
                                                   code:EVENT_INVALID_SPEAKER_CODE
                                               userInfo:userInfoDict];
        }
        return NO;
    }
    return YES;
}

-(BOOL)validateTitle:(id *)ioValue error:(NSError **)outError {
    // The title must not be nil, and must be a string.
    BOOL isNil = *ioValue == nil;
    BOOL isString = !isNil&&[*ioValue isKindOfClass:[NSString class]];
    if (isNil || !isString)
    {
        if (outError != NULL)
        {
            NSString *errorString = @"title missformated";
            
            NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
                                                                     forKey:NSLocalizedDescriptionKey];
            *outError = [[NSError alloc] initWithDomain:EVENT_ERROR_DOMAIN
                                                   code:EVENT_INVALID_TITLE_CODE
                                               userInfo:userInfoDict];
        }
        return NO;
    }
    return YES;
}

-(BOOL)validateLang:(id *)ioValue error:(NSError **)outError {
    // The lang must not be nil, and must be a string.
    BOOL isNil = *ioValue == nil;
    BOOL isString = !isNil&&[*ioValue isKindOfClass:[NSString class]];
    if (isNil || !isString)
    {
        if (outError != NULL)
        {
            NSString *errorString = @"lang missformated";
            
            NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
                                                                     forKey:NSLocalizedDescriptionKey];
            *outError = [[NSError alloc] initWithDomain:EVENT_ERROR_DOMAIN
                                                   code:EVENT_INVALID_LANG_CODE
                                               userInfo:userInfoDict];
        }
        return NO;
    }
    return YES;
}

-(BOOL)validateSummary:(id *)ioValue error:(NSError **)outError {
    // The summary must not be nil, and must be a string.
    BOOL isNil = *ioValue == nil;
    BOOL isString = !isNil&&[*ioValue isKindOfClass:[NSString class]];
    if (isNil || !isString)
    {
        if (outError != NULL)
        {
            NSString *errorString = @"summary missformated";
            
            NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
                                                                     forKey:NSLocalizedDescriptionKey];
            *outError = [[NSError alloc] initWithDomain:EVENT_ERROR_DOMAIN
                                                   code:EVENT_INVALID_SUMMARY_CODE
                                               userInfo:userInfoDict];
        }
        return NO;
    }
    return YES;
}

-(BOOL)validateSubevents:(id *)ioValue error:(NSError **)outError {
    // The subevents must not be nil, and must be an array.
    BOOL isNil = *ioValue == nil;
    BOOL isArray = !isNil&&[*ioValue isKindOfClass:[NSArray class]];
    if (isNil || !isArray)
    {
        if (outError != NULL)
        {
            NSString *errorString = @"subevents missformated";
            
            NSDictionary *userInfoDict = [NSDictionary dictionaryWithObject:errorString
                                                                     forKey:NSLocalizedDescriptionKey];
            *outError = [[NSError alloc] initWithDomain:EVENT_ERROR_DOMAIN
                                                   code:EVENT_INVALID_SUBEVENTS_CODE
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
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: %p> {\n",[self class],self,self.time];
    if(self.time)
    {
        [description appendString:[[NSString stringWithFormat:@"time: %@\n",self.time] stringWithIndentation]];
    }
    if(self.speaker)
    {
        [description appendString:[[NSString stringWithFormat:@"speaker: %@\n",self.speaker] stringWithIndentation]];
    }
    if(self.title)
    {
        [description appendString:[[NSString stringWithFormat:@"title: %@\n",self.title] stringWithIndentation]];
    }
    if(self.lang)
    {
        [description appendString:[[NSString stringWithFormat:@"lang: %@\n",self.lang] stringWithIndentation]];
    }
    if(self.summary)
    {
        [description appendString:[[NSString stringWithFormat:@"summary: %@\n",self.summary] stringWithIndentation]];
    }
    if(self.subevents)
    {
        NSMutableString *subeventsDescription = [NSMutableString stringWithFormat:@"<%@: %p>: subevents {\n",[self class],self];
        for (JUCEvent *event in self.subevents) {
            [subeventsDescription appendFormat:@"%@\n",[[event description] stringWithIndentation]];
        }
        [subeventsDescription appendString:@"}\n"];
        
        [description appendString:[subeventsDescription stringWithIndentation]];
    }
    [description appendString:@"}"];
    return [NSString stringWithString:description];
}

@end
