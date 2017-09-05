//
//  BKExampleCollectionViewController.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/25.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKExampleCollectionViewController.h"

@interface BKExampleCollectionViewController ()

@end

@implementation BKExampleCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.className;
}

- (void)configCollectionView {
    [super configCollectionView];
    
//    //  注册自定义Cell
//    [self registerClass:[BKCollectionViewCell class]];
    
    [self.collectionView registerClass:[BKCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    [self.collectionView registerClass:[BKCollectionViewCell class] forCellWithReuseIdentifier:@"cell2"];
    [self.collectionView registerClass:[BKCollectionViewCell class] forCellWithReuseIdentifier:@"cell3"];
    [self.collectionView registerClass:[BKCollectionViewCell class] forCellWithReuseIdentifier:@"cell4"];
    [self.collectionView registerClass:[BKCollectionViewCell class] forCellWithReuseIdentifier:@"cell5"];
    [self.collectionView registerClass:[BKCollectionViewCell class] forCellWithReuseIdentifier:@"cell6"];
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        //  自定义Cell
        BKCollectionViewCell *cell = [BKCollectionViewCell dequeueReusableCellWithCollectionView:collectionView indexPath:indexPath];
        
        return cell;
    }
    
    if (indexPath.row == 1) {
        BKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        
        cell.bk_textLabel.text = @"bk_textLabel";
        
        return cell;
    }
    
    if (indexPath.row == 2) {
        BKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
        
        [cell.bk_imageView setImage:[UIImage imageNamed:@"pay_alipay"]];
        
        cell.bk_textLabel.text = @"bk_textLabel";
        
        return cell;
    }
    
    if (indexPath.row == 3) {
        BKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell3" forIndexPath:indexPath];
        
        [cell.bk_imageView setImage:[UIImage imageNamed:@"pay_alipay"]];
        
        cell.bk_textLabel.text = @"bk_textLabel";
        
        cell.bk_accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    
    if (indexPath.row == 4) {
        BKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell4" forIndexPath:indexPath];
        
        [cell.bk_imageView setImage:[UIImage imageNamed:@"pay_alipay"]];
        
        cell.bk_textLabel.text = @"bk_textLabel";
        
        cell.bk_accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.bk_detailTextLabel.text = @"bk_detailTextLabel";
        
        return cell;
    }
    
    if (indexPath.row == 5) {
        BKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell5" forIndexPath:indexPath];
        
        cell.bk_textField.placeholder = @"bk_textField";
        
        return cell;
    }
    
    if (indexPath.row == 6) {
        BKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell6" forIndexPath:indexPath];
        
        cell.bk_textLabel.text = @"bk_textLabel";
        
        cell.bk_textField.placeholder = @"bk_textField";
        
        return cell;
    }
    
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

@end
