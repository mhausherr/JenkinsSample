//
//  JUCEventsService.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Services */
#import "AFNetworking.h"

/* JSON Parameters */
#define KEY_ROOMS @"rooms"

/** The iOS Application for the Jenkins User Conference of Paris.
 *
 * This is a class that provide access to the webservices relative to JUCEvent objects
 */

@interface JUCEventsService : NSObject

/**
 * Get JUCEvent business object represented in the cell at indexpath
 * @param success A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and an array of JCRoom returned by the server.
 * @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the resonse data. This block has no return value and takes two arguments:, the created request operation and the `NSError` object describing the network or parsing error that occurred.
 * @see JUCEvent
 */
+ (void) getRoomsWithSuccess:(void (^)(AFHTTPRequestOperation *request, NSArray *rooms))success
                      failure:(void (^)(AFHTTPRequestOperation *request, NSError *error))failure;

@end
