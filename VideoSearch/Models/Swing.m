//
//  Swing.m
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "Swing.h"

@implementation Swing

- (id)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        _startTime = ((NSNumber *)dict[@"startTime"]);
        _endTime = ((NSNumber *)dict[@"endTime"]);
    }
    return self;
}



@end
