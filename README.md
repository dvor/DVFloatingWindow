[![Build Status](https://travis-ci.org/dvor/DVFloatingWindow.png?branch=development)](https://travis-ci.org/dvor/DVFloatingWindow)

DVFloatingWindow is a simple and effective tool for reviewing your application logs just from within. 

You can manage them by creating a separate tab for each log, quickly switch between tabs and see all the details you need. Also there is an opportunity to add buttons with your custom handlers for helping you to debug your app (e.g. send a network request, reset settings, etc.).

![DVFloatingWindow GIF demo](https://raw.github.com/wiki/dvor/DVFloatingWindow/demo-0.3.gif)

# Installation

There are two possible methods to include DVFloatingWindow in your project:

1. Using [CocoaPods](http://cocoapods.org):
    * Add pod entry for DVFloatingWindow to your Podfile `pod 'DVFloatingWindow'`
    * Install the pod by running `pod install`

2. Manually: 
    * Get the [latest version](https://github.com/dvor/DVFloatingWindow/archive/0.3.zip)
    * Drag files from DVFloatingWindow folder to your project (Check **Add to target** and **Copy items into destination group's folder** checkboxes)

Enable DVFloatingWindow in your `<Project name>-Prefix.pch` file. Import a header file if you want to make it visible all over your project. Don't forget to disable DVFloatingWindow before submitting your app to AppStore!


```objc
#define DV_FLOATING_WINDOW_ENABLE 1

// uncomment if you want to make FLoatingWindow accessible all over project
//#import "DVFloatingWindow.h"
```

# Usage

### Setup the window display

First of all set gestures for showing/hiding the window (tap or long press). 

```objc
// to show/hide the window with 3 fingers tap
DVWindowActivationTap(3);
```

```objc
// to show/hide the window with 2 fingers long press for 0.5 second
DVWindowActivationLongPress(2, 0.5);
```

You can show/hide the window programmatically as well.

```objc
DVWindowShow();
DVWindowHide();
```

### Log to default logger

By default DVFloatingWindow has a *Default* logger tab. Logging to it is as simple as using NSLog:

```objc
DVLog(@"Current date and time: %@", [NSDate date]);
```
### Create custom loggers

You have to create custom loggers before using them. Any loggers methods take `NSString *` argument as a logger identifier.

```objc
DVLoggerCreate(@"My custom logger");

// and now you can log
DVLoggerLog(@"My custom logger", @"Here is current date again %@", [NSDate date]);

// a shorter version of previous macro
DVLLog(@"My custom logger", @"Hello");

// Default logger identifier is @"Default", so these two lines are similar
DVLLog(@"Default", @"This is an explicit way of logging to Default logger");
DVLog(@"This is an implicit way");

// to clean up all you've logged before
DVLoggerClear(@"Default");

// to delete logger if you don't need it anymore
DVLoggerRemove(@"My custom logger");

// you no longer have "My custom logger", so this line does nothing
DVLLog(@"My custom logger", @"You won't receive this message");
```

To configure logger please see **Configuration** section.

### Add buttons with handlers

If you need to clean NSUserDefaults, to send a request to server or to simulate a push receiving, you can add buttons with custom handlers.

```objc
// Button title, handler
DVButtonAdd(@"Remove authorization token", ^{
    [[NetworkManager sharedInstance] removeAuthorizationToken];
});
```

### Switch tabs

```objc
// go forward
DVTabNext();

// go back
DVTabPrevious();

// show the Default logger
DVTabSwitchToLogger(@"Default");

// show tab with buttons
DVTabSwitchToButtonsTab();
```

### Configuration

DVFloatingWindow has some amount of configurable options. All of them start with DVConfig prefix.

```objc
// you can get or set frame at any time:
CGRect dvFrame = DVConfigFrameGet();
dvFrame.origin.x = 30.0;
dvFrame.origin.y = 20.0;
DVConfigFrameSet(dvFrame);

// you can change all colors
DDLog(@"My old background color was %@", DVConfigBackgroundColorGet());

DVConfigBackgroundColorSet([UIColor grayColor]);

DDLog(@"My new background color is %@", DVConfigBackgroundColorGet());

// making it red
DVConfigTopBGColorSet       ([UIColor redColor]);
DVConfigTopMenuBGColorSet   ([UIColor darkGrayColor]);
DVConfigTopTextColorSet     ([UIColor whiteColor]);
DVConfigRightCornerColorSet ([UIColor redColor]);
```

You can set or get default email options.

```objc
DVConfigEmailToRecipientsSet(@[@"my@first.email", @"my@second.email"]);
DVConfigEmailCcRecipientsSet(@[@"my@third.email"]);

DVConfigEmailSubjectSet(@"My app logs");

DVConfigEmailMessageBodySet(@"Here are some logs:");
DVConfigEmailIsMessageBodyHTMLSet(NO);
```

Loggers have only set methods, first argument is always loggerKey.

```objc
DVConfigLoggerLatestMessageOnTop(@"Default", YES);

DVConfigLoggerFont(@"Pushes logger", [UIFont systemFontOfSize:17.0]);
```

### Release

When your app is ready to release simply disable DVFloatingWindow.

```objc
#define DV_FLOATING_WINDOW_ENABLE 0
```

# System Requirements

iOS 5.0 and greater

# Useful hints

### Redirecting NSLog

To send all your NSLogs to Xcode console and DVFloatingWindow just add this macro to `<Project name>-Prefix.pch` file.

```objc
#define NSLog(format, ...) DVLog(format, ##__VA_ARGS__); NSLog(format, ##__VA_ARGS__)
```

### Integrate with CocoaLumberjack

[CocoaLubmerjack](https://github.com/robbiehanson/CocoaLumberjack) is a cool logger for iOS and OS X. To integrate DVFloatingWindow with it you should get [DVFloatingLumberjack](https://github.com/dvor/DVFloatingLumberjack) logger.

# Bugs and feature requests

Found a bug? Have a feature request? [Please submit an issue](https://github.com/dvor/DVFloatingWindow/issues).

# Changelog

[CHANGELOG.md](CHANGELOG.md)

# Contact

[email](mailto:d@dvor.me)

[@__dvor](https://twitter.com/__dvor)

# License

DVFloatingWindow is available under the MIT license. See the [LICENSE](LICENSE.txt) file for more info.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/dvor/dvfloatingwindow/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

