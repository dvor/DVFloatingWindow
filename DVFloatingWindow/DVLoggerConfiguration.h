//
//  DVLoggerConfiguration.h
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 8/1/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVLoggerConfiguration : NSObject

@property (assign, nonatomic) BOOL latestMessageOnTop;
@property (strong, nonatomic) UIFont *font;

+ (DVLoggerConfiguration *)configurationWithLatestMessageOnTop:(BOOL)latestMessageOnTop
                                                          font:(UIFont *)font;

#pragma mark -  Deprecated

// scrollToNewMessage property isn't used now
// you can enable/disable scrolling with "autoscroll" button withing application
@property (assign, nonatomic) BOOL scrollToNewMessage __attribute__((deprecated));

+ (DVLoggerConfiguration *)configurationWithLatestMessageOnTop:(BOOL)latestMessageOnTop
                                            scrollToNewMessage:(BOOL)scrollToNewMessage
                                                          font:(UIFont *)font __attribute__((deprecated));

@end

