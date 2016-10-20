//
//  SearchUtils.m
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "SearchUtils.h"

@implementation SearchUtils

/**
 Search video array for videos that are within the start and end time parameters

 @param startTime Swing startime
 @param endTime   Swing endtime
 @param videos    Array of sorted videos

 @return Filtered array results
 */

+ (NSArray *)searchVideosWithStartAndEnd: (NSNumber *)startTime endTime:(NSNumber *)endTime withObjects:(NSArray *)videos{
    NSPredicate *search = [NSPredicate predicateWithFormat:@"startTime > %@ AND endTime < %@", startTime, endTime];
    return [videos filteredArrayUsingPredicate:search];
}

@end
