//
//  DVFloatingWindow.m
//  DVFloatingWindow
//
//  Created by Dmitry Vorobyov on 7/26/13.
//  Copyright (c) 2013 Dmitry Vorobyov. All rights reserved.
//

#import "DVFloatingWindow.h"
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
@property (strong, nonatomic) UILabel *topTitleLabel;
@property (strong, nonatomic) UIView *bottomCorner;
@property (strong, nonatomic) UIButton *nextButton;

@property (strong, nonatomic) NSMutableArray *arrayWithButtons;
@property (strong, nonatomic) NSMutableDictionary *dictWithLoggers;

@property (assign, nonatomic) BOOL areButtonsVisible;
@property (strong, nonatomic) NSString *visibleLoggerKey;

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

        self.arrayWithButtons = [NSMutableArray new];
        self.dictWithLoggers = [NSMutableDictionary new];

        self.areButtonsVisible = YES;
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

    frame = self.tableView.frame;
    frame.size.width = self.frame.size.width - 2 * BORDER_SIZE;
    frame.size.height = self.frame.size.height - TOP_BORDER_HEIGHT -
        BOTTOM_CORNER_SIZE - 2 * BORDER_SIZE;
    self.tableView.frame = frame;

    frame = self.nextButton.frame;
    frame.origin.y = self.frame.size.height - frame.size.height - BORDER_SIZE;
    self.nextButton.frame = frame;

    frame = self.topTitleLabel.frame;
    frame.size.width = self.frame.size.width - 2 * BORDER_SIZE;
    self.topTitleLabel.frame = frame;

    frame = self.bottomCorner.frame;
    frame.origin.x = self.frame.size.width - BOTTOM_CORNER_SIZE - BORDER_SIZE;
    frame.origin.y = self.frame.size.height - BOTTOM_CORNER_SIZE - BORDER_SIZE;
    self.bottomCorner.frame = frame;
}

#pragma mark -  Methods tab

- (void)tabShowNext
{
    if (! self.dictWithLoggers.count) {
        return;
    }
    NSArray *keys = [self sortedLoggersKeys];

    if (self.areButtonsVisible) {
        self.visibleLoggerKey = keys[0];
        self.areButtonsVisible = NO;
    }
    else {
        NSUInteger index = 1 + [keys indexOfObject:self.visibleLoggerKey];

        if (index < keys.count) {
            self.visibleLoggerKey = keys[index];
        }
        else {
            self.areButtonsVisible = YES;
        }
    }

    [self updateTopTitleLabelText];
    [self.tableView reloadData];
}

#pragma mark -  Methods window

- (void)windowShow
{
    if (! self.superview) {
        id delegate = [UIApplication sharedApplication].delegate;
        [[delegate window] addSubview:self];
    }
}

- (void)windowHide
{
    [self removeFromSuperview];
}

#pragma mark -  Methods logger

- (void)loggerCreate:(NSString *)key
{
    if (! [key isKindOfClass:[NSString class]] || self.dictWithLoggers[key]) {
        return;
    }

    self.dictWithLoggers[key] = [NSMutableArray new];
    [self updateTopTitleLabelText];
}

- (void)loggerClear:(NSString *)key
{
    if (! [key isKindOfClass:[NSString class]] || ! self.dictWithLoggers[key]) {
        return;
    }

    self.dictWithLoggers[key] = [NSMutableArray new];

    if (! self.areButtonsVisible && [key isEqualToString:self.visibleLoggerKey]) {
        [self.tableView reloadData];
    }
}

- (void)loggerRemove:(NSString *)key
{
    if (! [key isKindOfClass:[NSString class]] || ! self.dictWithLoggers[key]) {
        return;
    }

    if (! self.areButtonsVisible && [key isEqualToString:self.visibleLoggerKey]) {
        [self tabShowNext];
    }

    self.dictWithLoggers[key] = nil;
    [self updateTopTitleLabelText];
}

- (void)loggerLog:(NSString *)string toLogger:(NSString *)key
{
    if (! [string isKindOfClass:[NSString class]] ||
        ! [key isKindOfClass:[NSString class]] || 
        ! self.dictWithLoggers[key]) 
    {
        return;
    }

    NSMutableArray *array = self.dictWithLoggers[key];
    [array addObject:string];

    if (! self.areButtonsVisible && [key isEqualToString:self.visibleLoggerKey]) {
        [self.tableView reloadData];
    }
}

#pragma mark -  Methods button

- (void)buttonAddWithTitle:(NSString *)title
                   handler:(DVFloatingWindowButtonHandler)handler
{
    DVButtonObject *object = [DVButtonObject objectWithName:title handler:handler];

    [self.arrayWithButtons addObject:object];
    [self.tableView reloadData];
}

#pragma mark -  Gestures

- (void)topBorderPanGesture:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.topTitleLabel];
    [recognizer setTranslation:CGPointZero inView:self.topTitleLabel];

    CGRect frame = self.frame;
    frame.origin.x += translation.x;
    frame.origin.y += translation.y;

    self.frame = frame;
}

- (void)bottomCornerPanGesture:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.bottomCorner];
    [recognizer setTranslation:CGPointZero inView:self.bottomCorner];

    CGRect frame = self.frame;
    frame.size.width += translation.x;
    frame.size.height += translation.y;

    self.frame = frame;
}

#pragma mark -  UITableView dataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *buttonIdentifier = @"DVFloatingWindowCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:buttonIdentifier];

    if (! cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:buttonIdentifier];
    }

    if (self.areButtonsVisible) {
        DVButtonObject *object = self.arrayWithButtons[indexPath.row];
        cell.textLabel.text = object.name;
    }
    else {
        NSArray *array = self.dictWithLoggers[self.visibleLoggerKey];
        cell.textLabel.text = array[indexPath.row];
    }

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (self.areButtonsVisible) {
        return self.arrayWithButtons.count;
    }
    else {
        NSArray *array = self.dictWithLoggers[self.visibleLoggerKey];
        return array.count;
    }
}

#pragma mark -  UITableView delegate

- (void)       tableView:(UITableView *)tableView
 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (self.areButtonsVisible) {
        if (indexPath.row >= self.arrayWithButtons.count) {
            return;
        }

        DVButtonObject *object = self.arrayWithButtons[indexPath.row];
        if (object.handler) {
            object.handler();
        }
    }
}

#pragma mark -  Supporting methods

- (void)createSubviews
{
    {
        CGRect frame = CGRectZero;
        frame.origin.x = BORDER_SIZE;
        frame.origin.y = BORDER_SIZE + TOP_BORDER_HEIGHT;

        self.tableView = [[UITableView alloc] initWithFrame:frame];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self addSubview:self.tableView];
    }

    {
        self.nextButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [self.nextButton addTarget:self
                            action:@selector(tabShowNext)
                  forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.nextButton];

        CGRect frame = self.nextButton.frame;
        frame.origin.x = BORDER_SIZE;
        self.nextButton.frame = frame;
    }

    {
        CGRect frame = CGRectZero;
        frame.origin.x = frame.origin.y = BORDER_SIZE;
        frame.size.height = TOP_BORDER_HEIGHT;

        self.topTitleLabel = [[UILabel alloc] initWithFrame:frame];
        self.topTitleLabel.userInteractionEnabled = YES;
        self.topTitleLabel.backgroundColor = [UIColor greenColor];
        self.topTitleLabel.font = [UIFont systemFontOfSize:13.0];
        self.topTitleLabel.textColor = [UIColor blackColor];
        self.topTitleLabel.textAlignment = NSTextAlignmentCenter;
        self.topTitleLabel.text = @"<<Buttons>>";
        [self addSubview:self.topTitleLabel];

        UIPanGestureRecognizer *topPanGR = [[UIPanGestureRecognizer alloc]
            initWithTarget:self action:@selector(topBorderPanGesture:)];
        [self.topTitleLabel addGestureRecognizer:topPanGR];
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

- (NSArray *)sortedLoggersKeys
{
    return [[self.dictWithLoggers allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (void)updateTopTitleLabelText
{
    if (self.areButtonsVisible) {
        self.topTitleLabel.text = @"<<Buttons>>";
    }
    else {
        NSArray *keys = [self sortedLoggersKeys];

        self.topTitleLabel.text = [NSString stringWithFormat:@"%d <<%@>>",
            [keys indexOfObject:self.visibleLoggerKey], self.visibleLoggerKey];
    }
}

@end
