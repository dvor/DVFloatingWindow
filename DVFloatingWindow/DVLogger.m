//
//  DVLogger.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 8/1/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVLogger.h"

@interface DVLogger()

@property (strong, nonatomic) NSMutableArray *logsArray;

@end

@implementation DVLogger

#pragma mark -  Class methods

+ (DVLogger *)loggerWithDefaultConfiguration
{
    DVLogger *logger = [DVLogger new];

    logger.logsArray = [NSMutableArray new];
    logger.configuration = [DVLoggerConfiguration
        configurationWithLatestMessageOnTop:NO
                         scrollToNewMessage:YES
                                       font:[UIFont systemFontOfSize:10.0]];

    return logger;
}

#pragma mark -  Properties

- (NSUInteger)count
{
    return self.logsArray.count;
}

#pragma mark -  Methods

- (NSUInteger)addLog:(NSString *)log
{
    @synchronized(self) {
        if (self.configuration.latestMessageOnTop) {
            [self.logsArray insertObject:log atIndex:0];
            return 0;
        }
        else {
            [self.logsArray addObject:log];
            return self.logsArray.count-1;
        }
    }
}

- (NSString *)logAtIndex:(NSUInteger)index
{
    @synchronized(self) {
        if (index < self.logsArray.count) {
            return self.logsArray[index];
        }

        return nil;
    }
}

- (void)removeAllLogs
{
    @synchronized(self) {
        self.logsArray = [NSMutableArray new];
    }
}

- (NSData *)logsToData
{
    @synchronized(self) {
        NSString *logs = [self.logsArray componentsJoinedByString:@"\n"];

        return [logs dataUsingEncoding:NSUTF8StringEncoding];
    }
}

@end
