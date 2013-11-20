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
                                                          font:(UIFont *)font
{
    DVLoggerConfiguration *configuration = [DVLoggerConfiguration new];

    configuration.latestMessageOnTop = latestMessageOnTop;
    configuration.font = font;

    return configuration;
}

#pragma mark -  Deprecated

+ (DVLoggerConfiguration *)configurationWithLatestMessageOnTop:(BOOL)latestMessageOnTop
                                            scrollToNewMessage:(BOOL)scrollToNewMessage
                                                          font:(UIFont *)font
{
    return [self configurationWithLatestMessageOnTop:latestMessageOnTop font:font];
}

@end
