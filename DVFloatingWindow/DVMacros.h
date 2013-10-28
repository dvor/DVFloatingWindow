//
//  DVMacros.h
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 8/6/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#ifndef DVFloatingWindow_DVMacros_h
#define DVFloatingWindow_DVMacros_h

#ifndef DV_NO_DEPRECATED_MACROS
    #warning using depreated macros. To disable define DV_NO_DEPRECATED_MACROS before importing DVFloatingWindow.h
#endif

#if DV_FLOATING_WINDOW_ENABLE == 1

    #ifdef DV_NO_DEPRECATED_MACROS

        #define __DVLoggerConfiguration(latestMessageOnTop, theFont) \
            [DVLoggerConfiguration configurationWithLatestMessageOnTop:latestMessageOnTop \
                                                                  font:theFont]
    #else

        #define __DVLoggerConfiguration(latestMessageOnTop, scrollToNew, theFont) \
            [DVLoggerConfiguration configurationWithLatestMessageOnTop:latestMessageOnTop \
                                                    scrollToNewMessage:scrollToNew \
                                                                  font:theFont]
    #endif

     
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

    #ifndef DV_NO_DEPRECATED_MACROS

        #define DVLoggerSetConfiguration(loggerKey, latestMessageOnTop, scrollToNewMessage, font) \
            [[DVFloatingWindow sharedInstance] loggerSetConfigurationForLogger:loggerKey \
                                                                 configuration:__DVLoggerConfiguration(latestMessageOnTop, scrollToNewMessage, font)]
    #endif
    
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

    #define DVConfigEmailSubjectGet()           [DVFloatingWindow sharedInstance].configEmailSubject
    #define DVConfigEmailToRecipientsGet()      [DVFloatingWindow sharedInstance].configEmailToRecipients
    #define DVConfigEmailCcRecipientsGet()      [DVFloatingWindow sharedInstance].configEmailCcRecipients
    #define DVConfigEmailBccRecipientsGet()     [DVFloatingWindow sharedInstance].configEmailBccRecipients
    #define DVConfigEmailMessageBodyGet()       [DVFloatingWindow sharedInstance].configEmailMessageBody
    #define DVConfigEmailIsMessageBodyHTMLGet() [DVFloatingWindow sharedInstance].configEmailIsMessageBodyHTML

    #define DVConfigEmailSubjectSet(subject)                     [[DVFloatingWindow sharedInstance] setConfigEmailSubject:subject]
    #define DVConfigEmailToRecipientsSet(toRecipients)           [[DVFloatingWindow sharedInstance] setConfigEmailToRecipients:toRecipients]
    #define DVConfigEmailCcRecipientsSet(ccRecipients)           [[DVFloatingWindow sharedInstance] setConfigEmailCcRecipients:ccRecipients]
    #define DVConfigEmailBccRecipientsSet(bccRecipients)         [[DVFloatingWindow sharedInstance] setConfigEmailBccRecipients:bccRecipients]
    #define DVConfigEmailMessageBodySet(messageBody)             [[DVFloatingWindow sharedInstance] setConfigEmailMessageBody:messageBody]
    #define DVConfigEmailIsMessageBodyHTMLSet(isMessageBodyHTML) [[DVFloatingWindow sharedInstance] setConfigEmailIsMessageBodyHTML:isMessageBodyHTML]

    #ifdef DV_NO_DEPRECATED_MACROS
        #define DVConfigLogger(loggerKey, latestMessageOnTop, font) \
            [[DVFloatingWindow sharedInstance] configLogger:loggerKey \
                                              configuration:__DVLoggerConfiguration(latestMessageOnTop, font)]
    #endif

#else

    #ifdef DV_NO_DEPRECATED_MACROS
        #define __DVLoggerConfiguration(latestMessageOnTop, theFont) 
    #else
        #define __DVLoggerConfiguration(latestMessageOnTop, scrollToNew, theFont) 
    #endif
    
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
    
    #ifndef DV_NO_DEPRECATED_MACROS
        #define DVLoggerSetConfiguration(loggerKey, latestMessageOnTop, scrollToNewMessage, font) 
    #endif
    
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

    #define DVConfigEmailSubjectGet()
    #define DVConfigEmailToRecipientsGet()
    #define DVConfigEmailCcRecipientsGet()
    #define DVConfigEmailBccRecipientsGet()
    #define DVConfigEmailMessageBodyGet()
    #define DVConfigEmailIsMessageBodyHTMLGet()

    #define DVConfigEmailSubjectSet(subject)
    #define DVConfigEmailToRecipientsSet(toRecipients)
    #define DVConfigEmailCcRecipientsSet(ccRecipients)
    #define DVConfigEmailBccRecipientsSet(bccRecipients)
    #define DVConfigEmailMessageBodySet(messageBody)
    #define DVConfigEmailIsMessageBodyHTMLSet(isMessageBodyHTML)

    #ifdef DV_NO_DEPRECATED_MACROS
        #define DVConfigLogger(loggerKey, latestMessageOnTop, font)
    #endif

#endif

#define DVLLog(loggerKey, format, ...) DVLoggerLog(loggerKey, format, ##__VA_ARGS__)
#define DVLog(format, ...) DVLoggerLog(@"Default", format, ##__VA_ARGS__)

#endif
