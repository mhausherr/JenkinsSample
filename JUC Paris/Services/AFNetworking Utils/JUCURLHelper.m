//
//  JUCURLHelper.h
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCURLHelper.h"

/* Base Path */
#define BASE_PATH_DEV @"http://dl.dropbox.com/u/44098322/JUC/"
#define BASE_PATH_PROD @"http://"
#define BASE_PATH_LOCALHOST @"http://localhost/"

/* Urls */
#define GET_EVENTS_PATH @"events.json"

@implementation JUCURLHelper

/**************************************************************************************************/
#pragma mark - Common Urls

+ (NSString*)basePath
{
    return BASE_PATH_DEV;
}

/**************************************************************************************************/
#pragma mark - Events Urls

+ (NSString*)getEventsPath
{
    return GET_EVENTS_PATH;
}

@end
