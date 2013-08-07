//
//  DVButtonsViewController.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobjov on 8/6/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVButtonsViewController.h"
#import "DVFloatingWindow.h"

@interface DVButtonsViewController ()

@end

@implementation DVButtonsViewController

- (IBAction)colorButtonPressed:(id)sender
{
    UIColor *randomColor = [UIColor colorWithRed:arc4random() % 256 / 256.0
                                           green:arc4random() % 256 / 256.0
                                            blue:arc4random() % 256 / 256.0
                                           alpha:1.0];

    DVButtonAdd(@"Change color", ^{
        self.view.backgroundColor = randomColor;
    });

    DVTabSwitchToButtonsTab();
}

- (IBAction)randomLoggerButtonPressed:(id)sender
{
    CFUUIDRef uuidObj = CFUUIDCreate(NULL);
    NSString *identifier = (__bridge NSString *)CFUUIDCreateString(NULL, uuidObj);
    CFRelease(uuidObj);

    DVButtonAdd(@"Create random logger", ^{
        DVLoggerCreate(identifier);
        DVTabSwitchToLogger(identifier);
    });

    DVTabSwitchToButtonsTab();
}

@end
