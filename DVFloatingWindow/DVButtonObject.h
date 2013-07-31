//
//  DVButtonObject.h
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 7/31/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVDefinitions.h"

@interface DVButtonObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (copy, nonatomic) DVFloatingWindowButtonHandler handler;

+ (DVButtonObject *)objectWithName:(NSString *)name
                           handler:(DVFloatingWindowButtonHandler)handler;

@end
