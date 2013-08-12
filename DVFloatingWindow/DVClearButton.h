//
//  DVClearButton.h
//  DVFloatingWindow
//
//  Created by dvor on 13.08.13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DVClearButtonHandler) ();

@interface DVClearButton : UIView

@property (copy, nonatomic) DVClearButtonHandler clearHandler;

- (void)reset;

@end
