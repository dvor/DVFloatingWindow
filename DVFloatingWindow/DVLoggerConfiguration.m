//
//  DVLoggerConfiguration.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 8/1/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVLoggerConfiguration.h"

@implementation DVLoggerConfiguration

+ (DVLoggerConfiguration *)configurationWithLatestMessageOnTop:(BOOL)latestMessageOnTop
                                            scrollToNewMessage:(BOOL)scrollToNewMessage
                                                          font:(UIFont *)font
{
    DVLoggerConfiguration *configuration = [DVLoggerConfiguration new];

    configuration.latestMessageOnTop = latestMessageOnTop;
    configuration.scrollToNewMessage = scrollToNewMessage;
    configuration.font = font;

    return configuration;
}

@end
