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

- (IBAction)buttonPressed:(id)sender
{
    UIColor *randomColor = [UIColor colorWithRed:arc4random() % 256 / 256.0
                                           green:arc4random() % 256 / 256.0
                                            blue:arc4random() % 256 / 256.0
                                           alpha:1.0];

    const CGFloat *components = CGColorGetComponents(randomColor.CGColor);

    NSString *colorName = [NSString stringWithFormat:@"Change color to %f,%f,%f,%f", 
             components[0], components[1], components[2], components[3]];

    DVButtonAdd(colorName, ^{
        self.view.backgroundColor = randomColor;
    });
}

@end
