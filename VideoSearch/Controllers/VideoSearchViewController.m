//
//  VideoSearchViewController.m
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "VideoSearchViewController.h"

@interface VideoSearchViewController ()

@end

@implementation VideoSearchViewController

#pragma mark - Setup

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAllVideos];
    [self setupSteppers];
    [self searchForVideos:[NSNumber numberWithDouble:0.2] endtime:[NSNumber numberWithDouble:0.9]];
}

- (void)loadAllVideos{
    allVideos = [FakeGenUtils generateFakeVideoData];
    NSLog(@"%@",allVideos);
}

- (void)setupSteppers{
    _startTimeLabel.text = [NSString stringWithFormat:@"%.02f",_startTimeStepper.value];
    _endTimeLabel.text = [NSString stringWithFormat:@"%.02f",_endTimeStepper.value];
}

#pragma mark - Table View



#pragma mark - Search

- (void)searchForVideos: (NSNumber *)startTime endtime:(NSNumber *)endTime{
    searchResultVideos = [SearchUtils searchVideosWithStartAndEnd:[NSNumber numberWithDouble:0.40] endTime:[NSNumber numberWithDouble:0.95] withObjects:allVideos];
    NSLog(@"%@",searchResultVideos);
}


@end
