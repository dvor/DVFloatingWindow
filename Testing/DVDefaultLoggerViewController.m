//
//  DVDefaultLoggerViewController.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobjov on 8/6/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVDefaultLoggerViewController.h"
#import "DVLoggerViewController.h"
#import "DVFloatingWindow.h"

@interface DVDefaultLoggerViewController ()

@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation DVDefaultLoggerViewController

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

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.slider setValue:0.3 animated:NO];
    [self sliderChanged:self.slider];
}

- (void)viewDidUnload
{
    [self setSizeLabel:nil];
    [self setSlider:nil];
    [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    DVTabSwitchToLogger(@"Default");
    DVWindowShow();
}

#pragma mark -  Methods

- (void)nextButtonPressed
{
    [self.navigationController pushViewController:[DVLoggerViewController new]
                                         animated:YES];
}

- (IBAction)buttonPressed:(id)sender
{
    DVLog(@"%@", [NSDate date]);
}

- (IBAction)sliderChanged:(id)sender 
{
    CGFloat fontSize = 10.0 + self.slider.value * 10;
    UIFont *font = [UIFont systemFontOfSize:fontSize];

    DVLoggerSetConfiguration(@"Default", NO, YES, font);

    self.sizeLabel.text = [NSString stringWithFormat:@"%d", (int)fontSize];
}


@end
