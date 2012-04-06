//
//  CustomMacros.h
//  JUC Paris
//
//  Created by Mathieu Hausherr on 02/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#ifndef JUC_Paris_CustomMacros_h
#define JUC_Paris_CustomMacros_h

#define IS_IPAD ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define IS_IPHONE !IS_PAD

#define ALog(...) NSLog(__VA_ARGS__)

#ifdef DEBUG
#define DLog(...) NSLog(__VA_ARGS__)
#define Trace() [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]
#define DTrace() NSLog(@"%s", __PRETTY_FUNCTION__)
#else
#define DLog(...) /* */
#define DTrace() /* */
#endif


#endif
