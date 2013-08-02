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
@property (assign, nonatomic) BOOL scrollToNewMessage;

@property (strong, nonatomic) UIFont *font;

+ (DVLoggerConfiguration *)configurationWithLatestMessageOnTop:(BOOL)latestMessageOnTop
                                            scrollToNewMessage:(BOOL)scrollToNewMessage
                                                          font:(UIFont *)font;

@end
