//
//  DVButtonObject.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 7/31/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVButtonObject.h"

@implementation DVButtonObject

+ (DVButtonObject *)objectWithName:(NSString *)name
                           handler:(DVFloatingWindowButtonHandler)handler
{
    DVButtonObject *object = [DVButtonObject new];

    object.name = name;
    object.handler = handler;

    return object;
}

@end
