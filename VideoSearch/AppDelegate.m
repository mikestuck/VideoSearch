//
//  AppDelegate.m
//  VideoSearch
//
//  Created by Mike Stuck on 10/18/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Mixpanel sharedInstanceWithToken:@"8ea1269ce03beba7fcb67683eb786375"];
    [Fabric with:@[[Crashlytics class]]];
    Mixpanel *mixpanel = [Mixpanel sharedInstance];
    [mixpanel track:@"APP OPENED"];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    Mixpanel *mixpanel = [Mixpanel sharedInstance];
    [mixpanel track:@"APP IN BACKGROUND"];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    Mixpanel *mixpanel = [Mixpanel sharedInstance];
    [mixpanel track:@"APP IN FOREGROUND"];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    Mixpanel *mixpanel = [Mixpanel sharedInstance];
    [mixpanel track:@"APP TERMINATED"];
}


@end
