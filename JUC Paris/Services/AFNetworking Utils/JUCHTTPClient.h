//
//  JUCHTTPClient.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

/** The iOS Application for the Jenkins User Conference of Paris.
 *
 * This is an utility class that provide a singleton configured with server base Path
 */


@interface JUCHTTPClient : AFHTTPClient

/** HTTPClient singleton */
+ (id)sharedHTTPClient;

@end
