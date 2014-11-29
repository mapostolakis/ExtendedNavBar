//
//  ViewController.h
//  ExtendedNavBar
//
//  Created by Michail-Georgios Apostolakis on 08/11/2014.
//  Copyright (c) 2014 Michail-Georgios Apostolakis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;

@end
