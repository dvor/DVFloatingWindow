//
//  DVMacros.h
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 8/6/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#ifndef DVFloatingWindow_DVMacros_h
#define DVFloatingWindow_DVMacros_h

#if DV_FLOATING_WINDOW_ENABLE == 1

     #define __DVLoggerConfiguration(latestMessageOnTop, scrollToNew, theFont) \
         [DVLoggerConfiguration configurationWithLatestMessageOnTop:latestMessageOnTop \
                                                 scrollToNewMessage:scrollToNew \
                                                               font:theFont]
     
     #define DVWindowShow() [[DVFloatingWindow sharedInstance] windowShow]
     #define DVWindowHide() [[DVFloatingWindow sharedInstance] windowHide]
     #define DVWindowActivationTap(touchesNumber) \
          [[DVFloatingWindow sharedInstance] windowActivationTapWithTouchesNumber:touchesNumber]
     
     #define DVWindowActivationLongPress(touchesNumber, minPressDuration) \
         [[DVFloatingWindow sharedInstance] windowActivationLongPressWithTouchesNumber:touchesNumber \
                                                                  minimumPressDuration:minPressDuration]
     
     #define DVTapPrevious() [[DVFloatingWindow sharedInstance] tabShowPrevious]
     #define DVTabNext() [[DVFloatingWindow sharedInstance] tabShowNext]
     #define DVTabSwitchToLogger(loggerKey) \
         [[DVFloatingWindow sharedInstance] tabSwitchToLogger:loggerKey]
     #define DVTabSwitchToButtonsTab() \
         [[DVFloatingWindow sharedInstance] tabSwitchToButtonsTab]
     
     #define DVLoggerCreate(key) [[DVFloatingWindow sharedInstance] loggerCreate:key]
     #define DVLoggerClear(key) [[DVFloatingWindow sharedInstance] loggerClear:key]
     #define DVLoggerRemove(key) [[DVFloatingWindow sharedInstance] loggerRemove:key]
     
     #define DVLoggerSetConfiguration(loggerKey, latestMessageOnTop, scrollToNewMessage, font) \
         [[DVFloatingWindow sharedInstance] loggerSetConfigurationForLogger:loggerKey \
                                                              configuration:__DVLoggerConfiguration(latestMessageOnTop, scrollToNewMessage, font)]
     
     #define DVLoggerLog(loggerKey, format, ...) \
          [[DVFloatingWindow sharedInstance] loggerLogToLogger:loggerKey log:format, ##__VA_ARGS__]

    #define DVButtonAdd(title, theHandler) \
          [[DVFloatingWindow sharedInstance] buttonAddWithTitle:title handler:theHandler]

    #define DVConfigFrameGet() [DVFloatingWindow sharedInstance].configFrame
    #define DVConfigFrameSet(frame) [[DVFloatingWindow sharedInstance] setConfigFrame:frame]

    #define DVConfigBackgroundColorGet()  [DVFloatingWindow sharedInstance].backgroundColor
    #define DVConfigTopBGColorGet()       [DVFloatingWindow sharedInstance].configTopBGColor
    #define DVConfigTopMenuBGColorGet()   [DVFloatingWindow sharedInstance].configTopMenuBGColor
    #define DVConfigTopTextColorGet()     [DVFloatingWindow sharedInstance].configTopTextColor
    #define DVConfigRightCornerColorGet() [DVFloatingWindow sharedInstance].configRightCornerColor

    #define DVConfigBackgroundColorSet(color)  [[DVFloatingWindow sharedInstance] setConfigBackroundColor:color]
    #define DVConfigTopBGColorSet(color)       [[DVFloatingWindow sharedInstance] setConfigTopBGColor:color]
    #define DVConfigTopMenuBGColorSet(color)   [[DVFloatingWindow sharedInstance] setConfigTopMenuBGColor:color]
    #define DVConfigTopTextColorSet(color)     [[DVFloatingWindow sharedInstance] setConfigTopTextColor:color]
    #define DVConfigRightCornerColorSet(color) [[DVFloatingWindow sharedInstance] setConfigRightCornerColor:color]

#else

     #define __DVLoggerConfiguration(latestMessageOnTop, scrollToNew, theFont) 
     
     #define DVWindowShow() 
     #define DVWindowHide() 
     #define DVWindowActivationTap(touchesNumber) 
     
     #define DVWindowActivationLongPress(touchesNumber, minPressDuration) 
     
     #define DVTapNext 
     #define DVTabPrevious 
     #define DVTabSwitchToLogger(loggerKey) 
     #define DVTabSwitchToButtonsTab() 
     
     #define DVLoggerCreate(key) 
     #define DVLoggerClear(key) 
     #define DVLoggerRemove(key) 
     
     #define DVLoggerSetConfiguration(loggerKey, latestMessageOnTop, scrollToNewMessage, font) 
     
     #define DVLoggerLog(loggerKey, format, ...) 

     #define DVButtonAdd(title, theHandler) 

    #define DVConfigFrameGet() 
    #define DVConfigFrameSet(frame) 

    #define DVConfigBackgroundColorGet() 
    #define DVConfigTopBGColorGet() 
    #define DVConfigTopMenuBGColorGet() 
    #define DVConfigTopTextColorGet() 
    #define DVConfigRightCornerColorGet() 

    #define DVConfigBackgroundColorSet(color) 
    #define DVConfigTopBGColorSet(color) 
    #define DVConfigTopMenuBGColorSet(color) 
    #define DVConfigTopTextColorSet(color) 
    #define DVConfigRightCornerColorSet(color) 
     
#endif

#define DVLLog(loggerKey, format, ...) DVLoggerLog(loggerKey, format, ##__VA_ARGS__)
#define DVLog(format, ...) DVLoggerLog(@"Default", format, ##__VA_ARGS__)

#endif
