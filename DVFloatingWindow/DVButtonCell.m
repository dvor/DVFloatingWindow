//
//  DVButtonCell.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 7/31/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVButtonCell.h"

@implementation DVButtonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
