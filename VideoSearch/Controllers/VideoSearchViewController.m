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
    [self loadAllVideosAndSort];
    [self setupSteppers];
}

/**
    Load and sort mock video data
 */

- (void)loadAllVideosAndSort{
    allVideos = [FakeGenUtils generateMockVideoData];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"startTime" ascending:YES];
    sortedVideos = [allVideos sortedArrayUsingDescriptors:@[sortDescriptor]];
    [_videoTableView reloadData];
}

/**
    Do initial setup for stepper values and appearance
 */

- (void)setupSteppers{
    _startTimeStepper.tintColor = [ColorUtils startColor];
    _startTimeLabel.textColor = [ColorUtils startColor];
    _startTimeLabel.text = [NSString stringWithFormat:@"%.02f",_startTimeStepper.value];
    _endTimeStepper.tintColor = [ColorUtils endColor];
    _endTimeLabel.textColor = [ColorUtils endColor];
    _endTimeLabel.text = [NSString stringWithFormat:@"%.02f",_endTimeStepper.value];
}

#pragma mark - TableView dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(searchResultVideos.count == 0){
        return sortedVideos.count;
    }
    return searchResultVideos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"videodetailcell";
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[VideoTableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if(searchResultVideos.count == 0){
       Video *cellVideo = [sortedVideos objectAtIndex:indexPath.row];
        [cell createCellWithVideo:cellVideo];
    }
    else{
        Video *cellVideo = [searchResultVideos objectAtIndex:indexPath.row];
        [cell createCellWithVideo:cellVideo];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *headerTitle;
    headerTitle = @"Videos";
    return headerTitle;
}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    // Do nothing
}

#pragma mark - Steppers

- (IBAction)startTimeChanged:(id)sender {
    _startTimeLabel.text = [NSString stringWithFormat:@"%.02f",_startTimeStepper.value];
    _endTimeStepper.minimumValue = _startTimeStepper.value + 0.05;
    Swing *swing = [self createSwing];
    [self searchForVideos:swing];
}

- (IBAction)endTimeChanged:(id)sender {
    _endTimeLabel.text = [NSString stringWithFormat:@"%.02f",_endTimeStepper.value];
    _startTimeStepper.maximumValue = _endTimeStepper.value - 0.05;
    Swing *swing = [self createSwing];
    [self searchForVideos:swing];
}

#pragma mark - Search

/**
Handeler for calling and displaying SearchUtils results

 @param swing Swing object with start and end time
 */

- (void)searchForVideos: (Swing *)swing{
    searchResultVideos = [SearchUtils searchVideosWithStartAndEnd:[NSNumber numberWithDouble:swing.startTime.doubleValue] endTime:[NSNumber numberWithDouble:swing.endTime.doubleValue] withObjects:sortedVideos];
    if(searchResultVideos.count == 0){
        _videoTableView.hidden = true;
    }
    else{
        _videoTableView.hidden = false;
    }
    [_videoTableView reloadData];
}

#pragma mark - Helpers

/**
Helper to create a Swing object with current start and end time

 @return Swing object
 */

- (Swing *)createSwing{
    Swing *swing = [[Swing alloc] init];
    swing.startTime = [NSNumber numberWithDouble:_startTimeStepper.value];
    swing.endTime = [NSNumber numberWithDouble:_endTimeStepper.value];
    return swing;
}

@end
