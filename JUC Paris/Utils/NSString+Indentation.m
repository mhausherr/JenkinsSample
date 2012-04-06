//
//  NSString+Indentation.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "NSString+Indentation.h"

@implementation NSString (Indentation)

- (NSString *)stringWithIndentation
{
    static NSString *indent = @"   ";
    NSArray *lines = [self componentsSeparatedByString:@"\n"];
    NSMutableString *string = [NSMutableString string];
    for(NSString *line in lines) {
        if([line length] > 0) {
            [string appendFormat:@"%@%@\n", indent, line];      
        }
    }
    
    return [NSString stringWithString:string];
}

@end
