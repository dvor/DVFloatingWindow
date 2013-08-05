//
//  DVSampleViewController.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 7/26/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVSampleViewController.h"
#import "DVFloatingWindow.h"

@interface DVSampleViewController ()

@property (weak, nonatomic) IBOutlet UILabel *defaultFontSizeLabel;
@property (weak, nonatomic) IBOutlet UISlider *defaultFontSizeSlider;

@end

@implementation DVSampleViewController

#pragma mark -  Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.defaultFontSizeSlider setValue:0.3 animated:NO];
    [self defaultLoggerSliderChanged:self.defaultFontSizeSlider];
}

- (void)viewDidUnload 
{
    [self setDefaultFontSizeSlider:nil];
    [self setDefaultFontSizeLabel:nil];
    [super viewDidUnload];
}

#pragma mark -  Methods

- (IBAction)logDateToDefaultLoggerButtonPressed:(id)sender 
{
    DVLog(@"%@", [NSDate date]);
}

- (IBAction)defaultLoggerSliderChanged:(id)sender 
{
    CGFloat fontSize = 10.0 + self.defaultFontSizeSlider.value * 10;
    UIFont *font = [UIFont systemFontOfSize:fontSize];

    DVLoggerSetConfiguration(@"Default", NO, YES, font);

    self.defaultFontSizeLabel.text = [NSString stringWithFormat:@"%d", (int)fontSize];
}

- (IBAction)createButtonThatChangesColor:(id)sender 
{
    UIColor *randomColor = [UIColor colorWithRed:arc4random() % 256 / 256.0
                                           green:arc4random() % 256 / 256.0
                                            blue:arc4random() % 256 / 256.0
                                           alpha:1.0];

    [[DVFloatingWindow sharedInstance] buttonAddWithTitle:@"Change color" handler:^{
        self.view.backgroundColor = randomColor;
    }];
}


@end
