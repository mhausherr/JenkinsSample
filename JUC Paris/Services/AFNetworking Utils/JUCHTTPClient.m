//
//  JUCHTTPClient.h
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCHTTPClient.h"

#import "JUCURLHelper.h"
#import "JUCJSONRequestOperation.h"

@implementation JUCHTTPClient

+ (id)sharedHTTPClient
{
    static dispatch_once_t pred = 0;
    __strong static id __httpClient = nil;
    dispatch_once(&pred, ^{
        __httpClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:[JUCURLHelper basePath]]];
        [__httpClient setParameterEncoding:AFJSONParameterEncoding];
        [__httpClient registerHTTPOperationClass:[JUCJSONRequestOperation class]];
    });
    return __httpClient;
}


@end
