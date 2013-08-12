//
//  DVClearButton.m
//  DVFloatingWindow
//
//  Created by dvor on 13.08.13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVClearButton.h"

#define RESET_TIME_INTERVAL 5.0
#define CLEAR_TITLE @"Clear"
#define CONFIRM_TITLE @"Really?"

@interface DVClearButton()

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) NSTimer *resetTimer;

@end

@implementation DVClearButton

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.button setTitle:CLEAR_TITLE forState:UIControlStateNormal];
        [self.button addTarget:self
                        action:@selector(buttonPressed)
              forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.button];

        self.button.frame = self.bounds;
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];

    self.button.frame = self.bounds;
}

- (void)reset
{
    [self.resetTimer invalidate];
    self.resetTimer = nil;
    [self.button setTitle:CLEAR_TITLE forState:UIControlStateNormal];
}

- (void)buttonPressed
{
    if (self.resetTimer) {
        [self reset];
        [self.resetTimer invalidate];
        self.resetTimer = nil;

        [self.button setTitle:CLEAR_TITLE forState:UIControlStateNormal];

        if (self.clearHandler) {
            self.clearHandler();
        }
    }
    else {
        [self.button setTitle:CONFIRM_TITLE forState:UIControlStateNormal];

        self.resetTimer = [NSTimer scheduledTimerWithTimeInterval:RESET_TIME_INTERVAL
                                                           target:self
                                                         selector:@selector(reset)
                                                         userInfo:nil
                                                          repeats:NO];
    }
}

@end
