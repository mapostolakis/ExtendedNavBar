//
//  ViewController.m
//  ExtendedNavBar
//
//  Created by Michail-Georgios Apostolakis on 08/11/2014.
//  Copyright (c) 2014 Michail-Georgios Apostolakis. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController () 

@property (nonatomic, strong) NSArray *benchmarks;
@property (nonatomic, strong) NSArray *heroes;

@end

@implementation ViewController

- (NSArray *)benchmarks
{
    if (!_benchmarks) {
        NSArray *wods = @[@"Angie", @"Barbara", @"Fran", @"Cindy", @"Annie", @"Chelsea", @"Diane", @"Elizabeth", @"Grace", @"Helen",
                   @"Jackie", @"Karen", @"Kelly", @"Linda", @"Lynne", @"Mary", @"Nicole", @"Nancy"];
        _benchmarks = [wods sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
    return _benchmarks;
}

- (NSArray *)heroes
{
    if (!_heroes) {
        NSArray *wods = @[@"JT", @"MICHAEL", @"MURPH", @"DANIEL", @"JOSH", @"JASON", @"BADGER", @"JOSHIE", @"NATE", @"RANDY", @"TOMMY V", @"GRIFF",
                    @"RYAN", @"ERIN", @"DANNY", @"HANSEN", @"TYLER", @"LUMBERJACK 20", @"HELTON"];
        _heroes = [wods sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
    return _heroes;
}


#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"WODs";
    [self setupTableView];
    [self setupNavigationBar];
}


#pragma mark - Setup

- (void)setupTableView
{
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)setupNavigationBar
{
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"TransparentPixel"]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Pixel"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.rightBarButtonItem = [self addBarButton];
    self.navigationItem.leftBarButtonItem = [self cancelBarButton];
}


#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self arrayForSelectedSegmentedIndex].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [self arrayForSelectedSegmentedIndex][indexPath.row];
    return cell;
}


#pragma mark - Actions

- (IBAction)segmentedControlWasAltered
{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                          atScrollPosition:UITableViewScrollPositionTop animated:NO];
    [self.tableView reloadData];
}


#pragma mark - Controls

- (UIBarButtonItem *)addBarButton
{
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
}

- (UIBarButtonItem *)cancelBarButton
{
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:nil action:nil];
}


#pragma mark - Helpers

- (NSArray *)arrayForSelectedSegmentedIndex
{
    return (self.segmentedControl.selectedSegmentIndex == 0) ? self.benchmarks : self.heroes;
}

@end
