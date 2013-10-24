//
//  DVEmailManager.h
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 10/22/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVEmailManager : NSObject

- (BOOL)sendLogsToEmailFromLoggers:(NSDictionary *)dictWithLoggers;

@end
