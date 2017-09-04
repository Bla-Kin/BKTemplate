//
//  BKMainViewController.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/24.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKMainViewController.h"
#import "BKExampleTableViewController.h"
#import "BKExampleCollectionViewController.h"
#import "BKTestViewController.h"


@interface BKMainViewController ()

@end

@implementation BKMainViewController
//Example
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat size = [BKSystem getCacheSize];
    
    self.navigationItem.title = @"主页";
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        //  自定义Cell
        BKTableViewCell *cell = [BKTableViewCell dequeueReusableCellWithTableView:tableView indexPath:indexPath];
        
        cell.bk_textLabel.text = [BKExampleTableViewController className];
        
        return cell;
    }
    if (indexPath.row == 1) {
        BKTableViewCell *cell = [BKTableViewCell dequeueReusableCellWithTableView:tableView indexPath:indexPath];
        
        cell.bk_textLabel.text = [BKExampleCollectionViewController className];
        
        return cell;
    }
    if (indexPath.row == 2) {
        BKTableViewCell *cell = [BKTableViewCell dequeueReusableCellWithTableView:tableView indexPath:indexPath];
        
        cell.bk_textLabel.text = [BKTestViewController className];
        
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            BKExampleTableViewController *exampleTableVC = [[BKExampleTableViewController alloc] init];
            [self.navigationController pushViewController:exampleTableVC animated:YES];
        }
            break;
        case 1:
        {
            BKExampleCollectionViewController *exampleCollectionVC = [[BKExampleCollectionViewController alloc] init];
            [self.navigationController pushViewController:exampleCollectionVC animated:YES];
        }
            break;
        case 2:
        {
            BKTestViewController *vc = [[BKTestViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
