//
//  BKExampleTableViewController.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/24.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKExampleTableViewController.h"
#import "BKWeakTimer.h"

@interface BKExampleTableViewController ()

@property (weak, nonatomic) NSTimer *timer;

@end

@implementation BKExampleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.className;
    
}

- (void)configTableView {
    [super configTableView];
    
//    //  注册自定义Cell
//    [self registerClass:[BKTableViewCell class]];
    
    [self.tableView registerClass:[BKTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.tableView registerClass:[BKTableViewCell class] forCellReuseIdentifier:@"cell2"];
    [self.tableView registerClass:[BKTableViewCell class] forCellReuseIdentifier:@"cell3"];
    [self.tableView registerClass:[BKTableViewCell class] forCellReuseIdentifier:@"cell4"];
    [self.tableView registerClass:[BKTableViewCell class] forCellReuseIdentifier:@"cell5"];
    [self.tableView registerClass:[BKTableViewCell class] forCellReuseIdentifier:@"cell6"];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.001f;
    }
    return 5.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [BKTableViewCell height];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        //  自定义Cell
        BKTableViewCell *cell = [BKTableViewCell dequeueReusableCellWithTableView:tableView indexPath:indexPath];

        cell.backgroundColor = Random_Color;
        
        return cell;
    }
    
    if (indexPath.row == 1) {
        BKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        
        cell.bk_textLabel.text = @"bk_textLabel";

        cell.backgroundColor = Random_Color;
        
        return cell;
    }
    
    if (indexPath.row == 2) {
        BKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        
        [cell.bk_imageView setImage:[UIImage imageNamed:@"pay_alipay"]];
        
        cell.bk_textLabel.text = @"bk_textLabel";
        
        return cell;
    }
    
    if (indexPath.row == 3) {
        BKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
        
        [cell.bk_imageView setImage:[UIImage imageNamed:@"pay_alipay"]];
        
        cell.bk_textLabel.text = @"bk_textLabel";
        
        cell.bk_accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    
    if (indexPath.row == 4) {
        BKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4" forIndexPath:indexPath];
        
        [cell.bk_imageView setImage:[UIImage imageNamed:@"pay_alipay"]];
        
        cell.bk_textLabel.text = @"bk_textLabel";
        
        cell.bk_accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.bk_detailTextLabel.text = @"bk_detailTextLabel";
        
        return cell;
    }
    
    if (indexPath.row == 5) {
        BKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell5" forIndexPath:indexPath];
        
        cell.bk_textField.placeholder = @"bk_textField";
        
        return cell;
    }
    
    if (indexPath.row == 6) {
        BKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell6" forIndexPath:indexPath];
        
        cell.bk_textLabel.text = @"bk_textLabel";
        
        cell.bk_textField.placeholder = @"bk_textField";
        
        return cell;
    }
    
    return nil;
}

@end
