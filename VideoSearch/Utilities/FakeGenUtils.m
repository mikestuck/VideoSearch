//
//  FakeGenUtils.m
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "FakeGenUtils.h"
#import "Constants.h"

@implementation FakeGenUtils

/**
 Generate mock video data

 @return array of mock videos
 */

+ (NSMutableArray *)generateMockVideoData {
    NSMutableArray *mockVideos = [[NSMutableArray alloc] initWithCapacity:TOTAL_NUMBER_OF_VIDEOS];
    for(int i = 0; i < TOTAL_NUMBER_OF_VIDEOS; i++){
        double startTime = ((double)arc4random() / ARC4RANDOM_MAX)* (0.5 - 0)+ 0;
        double endTime = ((double)arc4random() / ARC4RANDOM_MAX)* (1 - 0.5)+ 0.5;
        Video *mockVideo = [[Video alloc] init];
        mockVideo.startTime = [NSNumber numberWithDouble:startTime];
        mockVideo.endTime = [NSNumber numberWithDouble:endTime];
        [mockVideos addObject:mockVideo];
    }
    return mockVideos;
}

@end
