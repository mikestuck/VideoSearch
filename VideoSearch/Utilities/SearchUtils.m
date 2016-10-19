//
//  SearchUtils.m
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "SearchUtils.h"

@implementation SearchUtils

+ (NSArray *)searchVideosWithStartAndEnd: (NSNumber *)startTime endTime:(NSNumber *)endTime withObjects:(NSArray *)videos{
    NSPredicate *search = [NSPredicate predicateWithFormat:@"startTime > %@ AND endTime < %@", startTime, endTime];
    return [videos filteredArrayUsingPredicate:search];
}

@end
