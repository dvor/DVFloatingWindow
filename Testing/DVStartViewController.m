//
//  DVStartViewController.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobjov on 8/6/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVStartViewController.h"
#import "DVFloatingWindow.h"
#import "DVDefaultLoggerViewController.h"

@interface DVStartViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation DVStartViewController

#pragma mark -  Lifecycle

- (id)init
{
    if (self = [super init]) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
            initWithTitle:@"Next"
                    style:UIBarButtonItemStylePlain
                   target:self
                   action:@selector(nextButtonPressed)];
    }
    
    return self;
}

- (void)viewDidUnload 
{
    [self setLabel:nil];
    [super viewDidUnload];
}

#pragma mark -  Methods

- (void)nextButtonPressed
{
    [self.navigationController pushViewController:[DVDefaultLoggerViewController new]
                                         animated:YES];
}

- (IBAction)twoFingersTapButtonPressed:(id)sender 
{
    DVWindowActivationTap(2);

    self.label.text = @"Two fingers tap anywhere to show/hide";
}
- (IBAction)longPressButtonPressed:(id)sender 
{
    DVWindowActivationLongPress(1, 0.5);

    self.label.text = @"Long press anywhere to show/hide";
}

@end
