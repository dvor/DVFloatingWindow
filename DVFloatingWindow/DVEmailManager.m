//
//  DVEmailManager.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 10/22/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import <MessageUI/MessageUI.h>

#import "DVEmailManager.h"
#import "DVLogger.h"

@interface DVEmailManager() <MFMailComposeViewControllerDelegate>

@end

@implementation DVEmailManager

#pragma mark -  Methods

- (BOOL)sendLogsToEmailFromLoggers:(NSDictionary *)dictWithLoggers
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailVC = [MFMailComposeViewController new];
        mailVC.mailComposeDelegate = self;
        [mailVC setSubject:@"Logs"];

        for (NSString *loggerKey in dictWithLoggers) {
            DVLogger *logger = dictWithLoggers[loggerKey];
            NSData *data = [logger logsToData];

            if (data) {
                [mailVC addAttachmentData:data
                                 mimeType:@"text/plain"
                                 fileName:[self logFilenameFromString:loggerKey]];
            }
        }


        [[self rootViewController] presentViewController:mailVC
                                                animated:YES
                                              completion:nil];

        return YES;
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] 
            initWithTitle:@"Error"
                  message:@"Please configure your mail settings"
                 delegate:nil
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil];

        [alertView show];

        return NO;
    }
}

#pragma mark -  MFMailComposeViewController delegate

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error
{
    [[self rootViewController] dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -  Supporting methods

- (NSString *)logFilenameFromString:(NSString *)string
{
    NSCharacterSet *illegalFileNameCharacters = [NSCharacterSet characterSetWithCharactersInString:@"/\\?%*|\"<>"];
    string = [[string componentsSeparatedByCharactersInSet:illegalFileNameCharacters] componentsJoinedByString:@""];

    return [NSString stringWithFormat:@"%@.txt", string];
}

- (UIViewController *)rootViewController
{
    id delegate = [UIApplication sharedApplication].delegate;
    return [[delegate window] rootViewController];
}

@end
