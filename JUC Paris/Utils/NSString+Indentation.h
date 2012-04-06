//
//  NSString+Indentation.h
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//


#import <Foundation/Foundation.h>

/** The iOS Application for the Jenkins User Conference of Paris.
 
 This is a category of NSString class that add indentation support.
 */

@interface NSString (Indentation)

/** Add identation to each line of a string.
 *
 * Identation is 3 space characters "   ". Line are separated by "\n" char.
 *
 * @return NString build by adding identation to current object
 */
- (NSString *)stringWithIndentation;

@end
