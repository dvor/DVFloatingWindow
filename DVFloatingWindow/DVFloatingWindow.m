//
//  DVFloatingWindow.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 7/26/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVFloatingWindow.h"
#import "DVButtonCell.h"
#import "DVButtonObject.h"

#define BORDER_SIZE 2
#define TOP_BORDER_HEIGHT 15
#define BOTTOM_CORNER_SIZE 15

#define MIN_ORIGIN_Y 20
#define MIN_VISIBLE_SIZE 15
#define MIN_WIDTH 30
#define MIN_HEIGHT 30

@interface DVFloatingWindow() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *topBorder;
@property (strong, nonatomic) UIView *bottomCorner;

@property (strong, nonatomic) NSMutableArray *arrayWithThings;

@end


@implementation DVFloatingWindow

#pragma mark -  Lifecycle

- (id)initWithFrame:(CGRect)frame
{
    return nil;
}

- (id)initPrivate
{
    if (self = [super initWithFrame:CGRectZero]) {
        [self createSubviews];

        self.frame = CGRectMake(0, 100, 100, 100);
        self.backgroundColor = [UIColor lightGrayColor];

        self.arrayWithThings = [NSMutableArray new];
    }

    return self;
}

+ (DVFloatingWindow *)sharedInstance
{
    static DVFloatingWindow *window;

    @synchronized(self) {
        if (! window) {
            window = [[DVFloatingWindow alloc] initPrivate];
        }
    }

    return window;
}

#pragma mark -  Methods

- (void)show
{
    if (! self.superview) {
        id delegate = [UIApplication sharedApplication].delegate;
        [[delegate window] addSubview:self];
    }
}

- (void)hide
{
    [self removeFromSuperview];
}

- (void)addButtonWithTitle:(NSString *)title
                   handler:(DVFloatingWindowButtonHandler)handler
{
    DVButtonObject *object = [DVButtonObject objectWithName:title handler:handler];

    [self.arrayWithThings addObject:object];
    [self.tableView reloadData];
}

- (void)setFrame:(CGRect)frame
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;

    if (frame.size.width < MIN_WIDTH) {
        frame.size.width = MIN_WIDTH;
    }
    if (frame.size.height < MIN_HEIGHT) {
        frame.size.height = MIN_HEIGHT;
    }
    if (frame.origin.x + frame.size.width < MIN_VISIBLE_SIZE) {
        frame.origin.x = MIN_VISIBLE_SIZE - frame.size.width;
    }
    if (frame.origin.y < MIN_ORIGIN_Y) {
        frame.origin.y = MIN_ORIGIN_Y;
    }
    if (frame.origin.x > screenBounds.size.width - MIN_VISIBLE_SIZE) {
        frame.origin.x = screenBounds.size.width - MIN_VISIBLE_SIZE;
    }
    if (frame.origin.y > screenBounds.size.height - MIN_VISIBLE_SIZE) {
        frame.origin.y = screenBounds.size.height - MIN_VISIBLE_SIZE;
    }

    [super setFrame:frame];

    frame = CGRectZero;
    frame.origin.x = BORDER_SIZE;
    frame.origin.y = BORDER_SIZE + TOP_BORDER_HEIGHT;
    frame.size.width = self.frame.size.width - 2 * BORDER_SIZE;
    frame.size.height = self.frame.size.height - TOP_BORDER_HEIGHT -
        2 * BORDER_SIZE;
    self.tableView.frame = frame;

    frame = self.topBorder.frame;
    frame.size.width = self.frame.size.width - 2 * BORDER_SIZE;
    self.topBorder.frame = frame;

    frame = self.bottomCorner.frame;
    frame.origin.x = self.frame.size.width - BOTTOM_CORNER_SIZE - BORDER_SIZE;
    frame.origin.y = self.frame.size.height - BOTTOM_CORNER_SIZE - BORDER_SIZE;
    self.bottomCorner.frame = frame;
}

#pragma mark -  Gestures

- (void)topBorderPanGesture:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.topBorder];
    [recognizer setTranslation:CGPointZero inView:self.topBorder];

    CGRect frame = self.frame;
    frame.origin.x += translation.x;
    frame.origin.y += translation.y;

    self.frame = frame;
}

- (void)bottomCornerPanGesture:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.topBorder];
    [recognizer setTranslation:CGPointZero inView:self.topBorder];

    CGRect frame = self.frame;
    frame.size.width += translation.x;
    frame.size.height += translation.y;

    self.frame = frame;
}

#pragma mark -  UITableView dataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *buttonIdentifier = @"DVButtonCell";
    DVButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:buttonIdentifier];

    if (! cell) {
        cell = [[DVButtonCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:buttonIdentifier];
    }

    DVButtonObject *object = self.arrayWithThings[indexPath.row];
    cell.textLabel.text = object.name;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.arrayWithThings.count;
}

#pragma mark -  UITableView delegate

- (void)       tableView:(UITableView *)tableView
 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= self.arrayWithThings.count) {
        return;
    }

    DVButtonObject *object = self.arrayWithThings[indexPath.row];
    if (object.handler) {
        object.handler();
    }
}

#pragma mark -  Supporting methods

- (void)createSubviews
{
    {
        self.tableView = [UITableView new];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self addSubview:self.tableView];
    }

    {
        CGRect frame = CGRectZero;
        frame.origin.x = frame.origin.y = BORDER_SIZE;
        frame.size.height = TOP_BORDER_HEIGHT;

        self.topBorder = [[UIView alloc] initWithFrame:frame];
        self.topBorder.backgroundColor = [UIColor greenColor];
        [self addSubview:self.topBorder];

        UIPanGestureRecognizer *topPanGR = [[UIPanGestureRecognizer alloc]
            initWithTarget:self action:@selector(topBorderPanGesture:)];
        [self.topBorder addGestureRecognizer:topPanGR];
    }

    {
        CGRect frame = CGRectZero;
        frame.size.width = frame.size.height = BOTTOM_CORNER_SIZE;

        self.bottomCorner = [[UIView alloc] initWithFrame:frame];
        self.bottomCorner.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.bottomCorner];

        UIPanGestureRecognizer *bottomPanGR = [[UIPanGestureRecognizer alloc]
            initWithTarget:self action:@selector(bottomCornerPanGesture:)];
        [self.bottomCorner addGestureRecognizer:bottomPanGR];
    }
}

@end
