//
//  DVAppDelegate.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 7/19/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVAppDelegate.h"
#import "DVFloatingWindow.h"
#import "DVSampleViewController.h"

@implementation DVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.rootViewController = [DVSampleViewController new];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    DVFloatingWindow *fw = [DVFloatingWindow sharedInstance];
    [fw windowActivationLongPressWithTouchesNumber:1 minimumPressDuration:1.0];
    
    for (int i = 0; i < 20; i++) {
        NSString *title = [NSString stringWithFormat:@"title %d", i]; 
        [fw buttonAddWithTitle:title handler:^{
            NSLog(@"---- %@", title);
        }];
    }

    [fw loggerCreate:@"B"];
    [fw loggerCreate:@"A"];

    [fw loggerLog:@"SomeMessage" toLogger:@"B"];


    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(timerTicked)
                                   userInfo:nil
                                    repeats:YES];
    return YES;
}

- (void)timerTicked
{
    NSString *text = [NSString stringWithFormat:@"%@", [NSDate date]];
    [[DVFloatingWindow sharedInstance] loggerLog:text toLogger:@"A"];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
