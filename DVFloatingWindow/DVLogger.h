//
//  DVLogger.h
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 8/1/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVLoggerConfiguration.h"

@interface DVLogger : NSObject

@property (strong, nonatomic) DVLoggerConfiguration *configuration;
@property (readonly, nonatomic) NSUInteger count;

+ (DVLogger *)loggerWithDefaultConfiguration;

// returns log index
- (NSUInteger)addLog:(NSString *)log;

- (NSString *)logAtIndex:(NSUInteger)index;
- (void)removeAllLogs;

@end
