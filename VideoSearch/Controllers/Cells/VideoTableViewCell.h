//
//  VideoTableViewCell.h
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

@interface VideoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;

- (void)createCellWithVideo:(Video *)video;

@end
