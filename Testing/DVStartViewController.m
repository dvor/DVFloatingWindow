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

@property (weak, nonatomic) IBOutlet UISegmentedControl *firstSegmented;
@property (weak, nonatomic) IBOutlet UISegmentedControl *secondSegmented;

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
    [self setFirstSegmented:nil];
    [self setSecondSegmented:nil];
    [super viewDidUnload];
}

#pragma mark -  Methods

- (void)nextButtonPressed
{
    [self.navigationController pushViewController:[DVDefaultLoggerViewController new]
                                         animated:YES];
}

- (IBAction)segmentedControllerChange:(id)sender 
{
    if (self.firstSegmented.selectedSegmentIndex == 0) {
        DVWindowActivationTap(self.secondSegmented.selectedSegmentIndex+1);
    }
    else {
        DVWindowActivationLongPress(self.secondSegmented.selectedSegmentIndex+1, 0.5);
    }
}

@end
