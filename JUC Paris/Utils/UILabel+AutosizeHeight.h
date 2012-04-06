//
//  UILabel+AutosizeHeight.h
//  JUC Paris
//
//  Created by Maxence Walbrou on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

/** The iOS Application for the Jenkins User Conference of Paris.
 
 This is a category of UILabel class that add autoresizing height support.
 */

@interface UILabel (UILabel_AutosizeHeight)

/**
 * Update UILabel frame to 
 * @param topAndBottomMarginHeight vertical margin which will be added to label height
 */
- (void) setHeightForCurrentTextWithMargin:(CGFloat)topAndBottomMarginHeight;

/**
 * Get necessary height for current text
 * @param topAndBottomMarginHeight vertical margin which will be added to label height
 * @return necessary height
 */
- (CGFloat) heightForCurrentTextWithMargin:(CGFloat)topAndBottomMarginHeight;

/**
 * Return necessary height for given-parameter text, width and font
 * @param text NSString object with current text
 * @param width CGFloat with current label width
 * @param font UIFont object for label
 * @return necessary height
 */
+ (CGFloat) getHeightForString:(NSString *)text withWidth:(CGFloat)width withFont:(UIFont *)font;

@end
