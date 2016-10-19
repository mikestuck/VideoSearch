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

+ (NSMutableArray *)generateFakeVideoData {
    NSMutableArray *fakeVideos = [[NSMutableArray alloc] initWithCapacity:TOTAL_NUMBER_OF_VIDEOS];
    for(int i = 0; i < TOTAL_NUMBER_OF_VIDEOS; i++){
        double startTime = ((double)arc4random() / ARC4RANDOM_MAX)* (0.5 - 0)+ 0;
        double endTime = ((double)arc4random() / ARC4RANDOM_MAX)* (1 - 0.5)+ 0.5;
        Video *fakeVideo = [[Video alloc] init];
        fakeVideo.startTime = [NSNumber numberWithDouble:startTime];
        fakeVideo.endTime = [NSNumber numberWithDouble:endTime];
        [fakeVideos addObject:fakeVideo];
    }
    return fakeVideos;
}

@end
