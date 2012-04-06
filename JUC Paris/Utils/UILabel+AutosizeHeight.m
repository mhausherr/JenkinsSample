//
//  UILabel+AutosizeHeight.m
//  JUC Paris
//
//  Created by Maxence Walbrou on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "UILabel+AutosizeHeight.h"

@implementation UILabel (UILabel_AutosizeHeight)

- (void)setHeightForCurrentTextWithMargin:(CGFloat)topAndBottomMarginHeight 
{
    CGFloat calculatedHeight = [self heightForCurrentTextWithMargin:topAndBottomMarginHeight];
    
    CGRect frame = self.frame;
    frame.size.height = calculatedHeight;
    self.frame = frame;
}

- (CGFloat)heightForCurrentTextWithMargin:(CGFloat)topAndBottomMarginHeight 
{
    CGFloat calculatedHeight = [UILabel getHeightForString:self.text withWidth:self.frame.size.width withFont:self.font] + 2 * topAndBottomMarginHeight;
    return calculatedHeight;
}

+ (CGFloat)getHeightForString:(NSString *)text withWidth:(CGFloat)width withFont:(UIFont *)font 
{
    CGSize constraint = CGSizeMake(width, 30000.0f);
	CGSize size = [text sizeWithFont:font constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    return size.height;
}

@end
