//
//  ErrorUtils.h
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ErrorUtils : NSObject

+ (void)showAlert:(NSString *)title subTitle:(NSString *)subTitle inView:(UIViewController *)view;

@end
