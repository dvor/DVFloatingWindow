//
//  DVFloatingWindow.h
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 7/26/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVDefinitions.h"
#import "DVLoggerConfiguration.h"
#import "DVMacros.h"

@interface DVFloatingWindow : UIView

+ (DVFloatingWindow *)sharedInstance;

- (void)windowShow;
- (void)windowHide;
- (void)windowActivationTapWithTouchesNumber:(NSUInteger)touchesNumber;
- (void)windowActivationLongPressWithTouchesNumber:(NSUInteger)touchesNumber
                              minimumPressDuration:(CFTimeInterval)minimumPressDuration;

- (void)tabShowPrevious;
- (void)tabShowNext;

- (void)loggerCreate:(NSString *)key;
- (void)loggerClear:(NSString *)key;
- (void)loggerRemove:(NSString *)key;
- (void)loggerSetConfigurationForLogger:(NSString *)key
                          configuration:(DVLoggerConfiguration *)configuration;

- (void)loggerLogToLogger:(NSString *)key log:(NSString *)string;

- (void)buttonAddWithTitle:(NSString *)title
                   handler:(DVFloatingWindowButtonHandler)handler;

@end
