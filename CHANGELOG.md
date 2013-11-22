## 0.3.1

###### Bugfixes

- Now all UI methods are performing on main thread

## 0.3

#### Deprecations

DVLoggerSetConfiguration() macro is now deprecated, as well as corresponding method

```objc
/**
 * DVLoggerSetConfiguration(
 *                             NSString *loggerKey,
 *                             BOOL latestMessageOnTop,
 *                             BOOL scrollToNewMessage,
 *                             UIFont *font
 *                         )
 */
- (void)loggerSetConfigurationForLogger:(NSString *)loggerKey
                          configuration:(DVLoggerConfiguration *)configuration __attribute__((deprecated));
```

Please use two following methods instead:

```objc
/**
 * If logger doesn't exist nothing happens.
 *
 * Corresponding macro -
 * DVConfigLoggerLatestMessageOnTop(NSString *loggerKey, BOOL latestMessageOnTop)
 */
- (void)configLogger:(NSString *)loggerKey latestMessageOnTop:(BOOL)latestMessageOnTop;

/**
 * If logger doesn't exist nothing happens.
 *
 * Corresponding macro - DVConfigLoggerFont(NSString *loggerKey, UIFont *font)
 */
- (void)configLogger:(NSString *)loggerKey font:(UIFont *)font;
```

`scrollToNewMessage` parameter is now unavaliable - to start/stop scrolling use *autoscroll*
button in UI.

###### Enhancements

- Window configuration
    - added methods for getting/setting window frame
    - added methods for getting/setting window colors
    - added methods for configuring email things (recipients, message body)
    - logger configuration method replaced with DVConfigLogger methods (see section above with deprecations)
- added *autoscroll* button in UI

###### Bugfixes

- Button tab didn't have it own font so it was using font of the previous tab
- Refactoring - DVFloatingWindow.h file is now broken in categories with appropriate methods

## 0.2.1

###### Enhancements

- Button for sending all logs via email

###### Bugfixes

- Fixed crashes on tab changing and sending log to email
- Added empty macro DVButtonAdd (in case if DVFloatingWindow is disabled)

## 0.2

###### Enhancements

- Added menu
    - Clear button in menu for clearing current log
    - Email button for sending logs via email

###### Bugfixes

- TableView usage optimization. Now everything works much faster in case of heavy logging.
- Thread safety. All public methods are wrapped in @synchronized

## 0.1

- Show/hide window
- Create some loggers in different tabs
- Default logger is created by default
- Add buttons with handlers
- Gif file with demo

