//
//  JUCURLHelper.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

/** The iOS Application for the Jenkins User Conference of Paris.
 *
 * This is an helper class that provide url path of the webserver
 */


@interface JUCURLHelper : NSObject

/**************************************************************************************************/
#pragma mark - Common Urls

/** @return Webserver base path */
+ (NSString*)basePath;

/**************************************************************************************************/
#pragma mark - Events Urls

/** @return Webserver GET events path */
+ (NSString*)getEventsPath;

@end
