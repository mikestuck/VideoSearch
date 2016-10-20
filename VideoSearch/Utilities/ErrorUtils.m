//
//  ErrorUtils.m
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "ErrorUtils.h"

@implementation ErrorUtils

/**
 Easy function to show alert controller with "Ok" action

 @param title    Title of alert controller
 @param subTitle Subtitle of alert controller
 @param view     View that is to present the alert controller
 */

+ (void)showAlert:(NSString *)title subTitle:(NSString *)subTitle inView:(UIViewController *)view{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:subTitle
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alert addAction:ok];
    
    [view presentViewController:alert animated:YES completion:nil];
}

@end
