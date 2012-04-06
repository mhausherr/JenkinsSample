//
//  JUCJSONRequestOperation.h
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCJSONRequestOperation.h"

@implementation JUCJSONRequestOperation

+ (NSSet *)defaultAcceptableContentTypes {
    return [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
}

+ (NSSet *)defaultAcceptablePathExtensions {
    return [NSSet setWithObjects:@"json", nil];
}

+ (BOOL)canProcessRequest:(NSURLRequest *)request {
    return [[self defaultAcceptableContentTypes] containsObject:[request valueForHTTPHeaderField:@"Accept"]] || [[self defaultAcceptablePathExtensions] containsObject:[[request URL] pathExtension]];
}

@end
