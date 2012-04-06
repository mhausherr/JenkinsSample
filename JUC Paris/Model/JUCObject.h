//
//  JUCObject.h
//  JUC Paris
//
//  Created by Mathieu Hausherr on 06/04/12.
//  Copyright (c) 2012 Octo Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

/** The iOS Application for the Jenkins User Conference of Paris.
 *
 * This is the business abstract class of the project. This class provide some method to allow KVC instanciation for the object.
 */

@interface JUCObject : NSObject

/** Load object from a dictionary.
 *
 * Perform KVC validation. Unsupported key are just ignored.
 * @param dictionary Value to load in object
 * @see http://developer.apple.com/library/ios/documentation/cocoa/conceptual/KeyValueCoding/Articles/KeyValueCoding.html
 */
- (void)loadObjectFromDictionnary:(NSDictionary *)dictionary;

/** Get new object from a dictionary.
 *
 * @param dictionary Value to load in object
 * @see loadObjectFromDictionnary:
 */
+ (id)objectWithDictionary:(NSDictionary *)dictionary;

@end
