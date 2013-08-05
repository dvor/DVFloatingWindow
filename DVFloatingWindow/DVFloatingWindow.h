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


/**
 * Show window if it was hidden.
 *
 * Corresponding macro if DVWindowShow()
 */
- (void)windowShow;

/**
 * Hides window if it was visible.
 *
 * Corresponding macro is DVWindowHide()
 */
- (void)windowHide;

/**
 * Set tap gesture recognizer as activation gesture. From now on tap with touchesNumber
 * the window will show/hide automatically.
 * 
 * Rewrites activation gesture that was set before.
 *
 * Corresponding macro is DVWindowActivationTap(touchesNumber)
 */
- (void)windowActivationTapWithTouchesNumber:(NSUInteger)touchesNumber;

/**
 * Set long press gesture recognizer as activation gesture. From now on long press with
 * touchesNumber and at least minimumPressDuration the window will show/hide automatically.
 * 
 * Rewrites activation gesture that was set before.
 *
 * Corresponding macro is DVWindowActivationLongPress(touchesNumber, minimumPressDuration)
 */
- (void)windowActivationLongPressWithTouchesNumber:(NSUInteger)touchesNumber
                              minimumPressDuration:(CFTimeInterval)minimumPressDuration;


/**
 * Switch to previous or next tabs. The action is similar to manual previous tab button press.
 *
 * Corresponding macros are DVTabPrevious() and DVTabNext()
 */
- (void)tabShowPrevious;
- (void)tabShowNext;


/**
 * Create logger with NSString as key (identifier). Only after creation logger can be 
 * configured, cleared, removed, the log can be send to it.
 *
 * Corresponding macro is DVLoggerCreate(loggerKey)
 */
- (void)loggerCreate:(NSString *)loggerKey;

/**
 * Removes all logs that were logged to logger.
 *
 * If the logger doesn't exist nothing happens.
 *
 * Corresponding macro is DVLoggerClear(loggerKey)
 */
- (void)loggerClear:(NSString *)loggerKey;

/**
 * Remove logger. After removing, all other methods with same logger key do nothing.
 *
 * If the logger doesn't exist nothing happens.
 *
 * Corresponding macro is DVLoggerRemove(loggerKey)
 */
- (void)loggerRemove:(NSString *)loggerKey;

/**
 * Set configuration for logger. The configuration if applied only to new messages.
 *
 * ! WARNING for nice workflow configuration should be set before sending any log
 *
 * If the logger doesn't exist nothing happens.
 *
 * Corresponding macro is DVLoggerSetConfiguration(
 *                                                    NSString *loggerKey,
 *                                                    BOOL latestMessageOnTop,
 *                                                    BOOL scrollToNewMessage,
 *                                                    UIFont *font
 *                                                )
 */
- (void)loggerSetConfigurationForLogger:(NSString *)loggerKey
                          configuration:(DVLoggerConfiguration *)configuration;

/**
 * Add string with format to logger. The appearance depends on logger's configuration.
 *
 * If the logger doesn't exist nothing happens.
 *
 * Corresponding macro is DVLoggerLog(loggerKey, format, ...)
 * Also this method has short macro DVLLog(loggerKey, format, ...)
 */
- (void)loggerLogToLogger:(NSString *)loggerKey
                      log:(NSString *)format,...;


/**
 * Add button with handler to buttons tab (which is always first). On the button pressed
 * handler is called (if exists).
 */
- (void)buttonAddWithTitle:(NSString *)title
                   handler:(DVFloatingWindowButtonHandler)handler;

@end
