//
//  JUCEventsService.m
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import "JUCEventsService.h"

#import "JUCHTTPClient.h"
#import "JUCURLHelper.h"

/* Model */
#import "JUCRoom.h"

@interface JUCEventsService ()
+ (NSArray *)parseRoomsFromDictionary:(NSDictionary *)jsonDict;
@end

@implementation JUCEventsService

+ (NSArray *)parseRoomsFromDictionary:(NSDictionary *)jsonDict
{    
    if(jsonDict && [jsonDict isKindOfClass:[NSDictionary class]])
    {
        NSArray *roomsArray = [jsonDict objectForKey:KEY_ROOMS];
        NSMutableArray *rooms = [NSMutableArray arrayWithCapacity:[roomsArray count]];
        for (NSDictionary* roomData in roomsArray)
        {
            [rooms addObject:[JUCRoom objectWithDictionary:roomData]];
        }
        return rooms;
    }
    return nil;
}

+ (void) getRoomsWithSuccess:(void (^)(AFHTTPRequestOperation *request, NSArray *rooms))success
                      failure:(void (^)(AFHTTPRequestOperation *request, NSError *error))failure
{
    NSString *path = [JUCURLHelper getEventsPath];    
    [[JUCHTTPClient sharedHTTPClient] getPath:path
                                  parameters:nil
                                     success:^(AFHTTPRequestOperation *request, id JSON) {
                                        
                                         NSArray *rooms = [self parseRoomsFromDictionary:JSON];
                                         
                                         if(success) 
                                         {
                                             success(request, rooms);
                                         }
                                     }
                                     failure:^(AFHTTPRequestOperation *request, NSError *error) {
                                         DLog(@"ERROR getEventsWithSuccess fails with error %@", error);
                                         
                                         if(failure)
                                         {
                                             failure(request, error);
                                         }
                                     }
     ];
}


@end
