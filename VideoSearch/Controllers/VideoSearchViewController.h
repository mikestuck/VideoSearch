//
//  VideoSearchViewController.h
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FakeGenUtils.h"
#import "SearchUtils.h"
#import "Video.h"
#import "ErrorUtils.h"
#import "Swing.h"
#import "VideoTableViewCell.h"
#import "ColorUtils.h"

@interface VideoSearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSArray *allVideos;
    NSArray *searchResultVideos;
}

@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UIStepper *startTimeStepper;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UIStepper *endTimeStepper;
@property (weak, nonatomic) IBOutlet UITableView *videoTableView;

@end
