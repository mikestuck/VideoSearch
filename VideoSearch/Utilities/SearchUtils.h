//
//  SearchUtils.h
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchUtils : NSObject

+ (NSArray *)searchVideosWithStartAndEnd: (NSNumber *)startTime endTime:(NSNumber *)endTime withObjects:(NSArray *)videos;

@end
