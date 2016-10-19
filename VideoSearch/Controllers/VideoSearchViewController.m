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
}

- (void)loadAllVideos{
    allVideos = [FakeGenUtils generateFakeVideoData];
    NSLog(@"%@",allVideos);
}

- (void)setupSteppers{
    _startTimeLabel.text = [NSString stringWithFormat:@"%.02f",_startTimeStepper.value];
    _endTimeLabel.text = [NSString stringWithFormat:@"%.02f",_endTimeStepper.value];
}

#pragma mark - TableView dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"videodetailcell";
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[VideoTableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
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

- (void)searchForVideos: (Swing *)swing{
    searchResultVideos = [SearchUtils searchVideosWithStartAndEnd:[NSNumber numberWithDouble:swing.startTime.doubleValue] endTime:[NSNumber numberWithDouble:swing.endTime.doubleValue] withObjects:allVideos];
    NSLog(@"%@",searchResultVideos);
    if(searchResultVideos.count == 0){
        [ErrorUtils showAlert:@"Oh no!" subTitle:@"looks like there are no videos that match your search..." inView:self];
    }
    [_videoTableView reloadData];
}

#pragma mark - Helpers

- (Swing *)createSwing{
    Swing *swing = [[Swing alloc] init];
    swing.startTime = [NSNumber numberWithDouble:_startTimeStepper.value];
    swing.endTime = [NSNumber numberWithDouble:_endTimeStepper.value];
    return swing;
}


@end
