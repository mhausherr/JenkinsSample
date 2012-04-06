//
//  JUCObject.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCObject.h"

@implementation JUCObject

- (void)loadObjectFromDictionnary:(NSDictionary *)dictionary
{
    id parsedValue = nil;
    for (NSString *key in [dictionary allKeys]) {
        parsedValue = [dictionary objectForKey:key];
        
        if([self validateValue:&parsedValue forKey:key error:nil])
        {
            [self setValue:parsedValue forKey:key];
        }
    }
}

+ (id)objectWithDictionary:(NSDictionary *)dictionary
{
    if(![dictionary isKindOfClass:[NSDictionary class]])
    {
        return nil;
    }
    
    
    id object = [[self alloc] init];
    if(object)
    {
        [object loadObjectFromDictionnary:dictionary];
    }
    
    return object;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    return;
}

@end
