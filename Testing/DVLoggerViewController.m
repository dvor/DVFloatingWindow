//
//  DVLoggerViewController.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobjov on 8/6/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVLoggerViewController.h"
#import "DVFloatingWindow.h"
#import "DVButtonsViewController.h"

@interface DVLoggerViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *textToLogTextField;

@end

@implementation DVLoggerViewController

#pragma mark -  Lifecycle

- (id)init
{
    if (self = [super init]) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
            initWithTitle:@"Next"
                    style:UIBarButtonItemStylePlain
                   target:self
                   action:@selector(nextButtonPressed)];
    }
    
    return self;
}

- (void)viewDidUnload 
{
    [self setTitleTextField:nil];
    [self setTextToLogTextField:nil];
    [super viewDidUnload];
}

#pragma mark -  Methods

- (void)nextButtonPressed
{
    [self.navigationController pushViewController:[DVButtonsViewController new]
                                         animated:YES];
}

- (IBAction)clearButtonPressed:(id)sender 
{
    DVLoggerClear(self.titleTextField.text);
}

- (IBAction)removeButtonPressed:(id)sender 
{
    DVLoggerRemove(self.titleTextField.text);
}

- (IBAction)createButtonPressed:(id)sender 
{
    DVLoggerCreate(self.titleTextField.text);
}

- (IBAction)logButtonPressed:(id)sender 
{
    DVLLog(self.titleTextField.text, self.textToLogTextField.text);
}

@end
