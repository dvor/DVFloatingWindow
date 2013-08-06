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
 * Show the window if it's hidden.
 *
 * Corresponding macro - DVWindowShow()
 */
- (void)windowShow;

/**
 * Hide the window if it's visible.
 *
 * Corresponding macro - DVWindowHide()
 */
- (void)windowHide;

/**
 * Set tap gesture recognizer as an activation gesture. From now on, when tapped with
 * touchesNumber, the window will show/hide automatically.
 * 
 * Rewrite activation gesture that has been set before.
 *
 * Corresponding macro - DVWindowActivationTap(touchesNumber)
 */
- (void)windowActivationTapWithTouchesNumber:(NSUInteger)touchesNumber;

/**
 * Set long press gesture recognizer as an activation gesture. From now on, long pressed 
 * with touchesNumber and at least minimumPressDuration, the window will show/hide
 * automatically.
 * 
 * Rewrite activation gesture that has been set before.
 *
 * Corresponding macro - DVWindowActivationLongPress(touchesNumber, minimumPressDuration)
 */
- (void)windowActivationLongPressWithTouchesNumber:(NSUInteger)touchesNumber
                              minimumPressDuration:(CFTimeInterval)minimumPressDuration;


/**
 * Switch to previous or next tabs. This action is similar to pressing previous/next
 * buttons manually.
 *
 * Corresponding macros - DVTabPrevious(), DVTabNext()
 */
- (void)tabShowPrevious;
- (void)tabShowNext;


/**
 * Create logger with NSString as a key (identifier). Only after logger was created it can
 * be configured, cleared, removed or receive a sent log.
 *
 * Corresponding macro - DVLoggerCreate(loggerKey)
 */
- (void)loggerCreate:(NSString *)loggerKey;

/**
 * Remove all logs that from logger.
 *
 * If logger doesn't exist nothing happens.
 *
 * Corresponding macro - DVLoggerClear(loggerKey)
 */
- (void)loggerClear:(NSString *)loggerKey;

/**
 * Remove logger. After removing, all other methods with a same logger key will do nothing.
 *
 * If logger doesn't exist nothing happens.
 *
 * Corresponding macro - DVLoggerRemove(loggerKey)
 */
- (void)loggerRemove:(NSString *)loggerKey;

/**
 * Set configuration for logger.
 *
 * If logger doesn't exist nothing happens.
 *
 * Corresponding macro - DVLoggerSetConfiguration(
 *                                                   NSString *loggerKey,
 *                                                   BOOL latestMessageOnTop,
 *                                                   BOOL scrollToNewMessage,
 *                                                   UIFont *font
 *                                               )
 */
- (void)loggerSetConfigurationForLogger:(NSString *)loggerKey
                          configuration:(DVLoggerConfiguration *)configuration;

/**
 * Add string with format to logger. The appearance depends on a logger configuration.
 *
 * If logger doesn't exist nothing happens.
 *
 * Corresponding macro -              DVLoggerLog(loggerKey, format, ...)
 * Also this method has short macro - DVLLog(loggerKey, format, ...)
 */
- (void)loggerLogToLogger:(NSString *)loggerKey
                      log:(NSString *)format,...;


/**
 * Add a button with handler to buttons tab. When the button is pressed, handler is called
 * (if exists).
 *
 * Corresponding macro - DVButtonAdd(
 *                                      NSString *title,
 *                                      DVFloatingWindowButtonHandler handler
 *                                  )
 */
- (void)buttonAddWithTitle:(NSString *)title
                   handler:(DVFloatingWindowButtonHandler)handler;

@end
