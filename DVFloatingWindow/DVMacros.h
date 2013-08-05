//
//  DVMacros.h
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 8/6/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#ifndef DVFloatingWindow_DVMacros_h
#define DVFloatingWindow_DVMacros_h

#define DVWindowShow() [[DVFloatingWindow sharedInstance] windowShow]
#define DVWindowHide() [[DVFloatingWindow sharedInstance] windowHide]
#define DVWindowActivationTap(touchesNumber) [[DVFloatingWindow sharedInstance] \
                                      windowActivationTapWithTouchesNumber:touchesNumber]

#define DVWindowActivationLongPress(touchesNumber, minPressDuration) \
    [[DVFloatingWindow sharedInstance] windowActivationLongPressWithTouchesNumber:touchesNumber \
                                                             minimumPressDuration:minPressDuration]

#define DVTapNext [[DVFloatingWindow sharedInstance] tabShowPrevious]
#define DVTabPrevious [[DVFloatingWindow sharedInstance] tabShowNext]

#define DVLoggerCreate(key) [[DVFloatingWindow sharedInstance] loggerCreate:key]
#define DVLoggerClear(key) [[DVFloatingWindow sharedInstance] loggerClear:key]
#define DVLoggerRemove(key) [[DVFloatingWindow sharedInstance] loggerRemove:key]
#define DVLoggerLog(loggerKey, string) [[DVFloatingWindow sharedInstance] \
    loggerLogToLogger:loggerKey log:string]

#define DVLLog(loggerKey, string) DVLoggerLog(loggerKey, string)


#endif
