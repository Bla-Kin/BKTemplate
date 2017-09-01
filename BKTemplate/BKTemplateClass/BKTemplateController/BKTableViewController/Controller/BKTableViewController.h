//
//  BKTableViewController.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/6/5.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKViewController.h"
#import "BKTableViewCell.h"

@interface BKTableViewController : BKViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

- (void)configTableView;

- (void)registerClass:(Class)cellClass;

- (void)tableViewRefresh;

@end
