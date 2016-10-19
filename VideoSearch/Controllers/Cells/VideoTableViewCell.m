//
//  VideoTableViewCell.m
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "VideoTableViewCell.h"

@implementation VideoTableViewCell

- (void)createCellWithVideo:(Video *)video{
    _startTimeLabel.text = [NSString stringWithFormat:@"%.02f",video.startTime.doubleValue];
    _endTimeLabel.text = [NSString stringWithFormat:@"%.02f",video.endTime.doubleValue];
}

@end
