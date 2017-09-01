//
//  BKCollectionViewCell.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/25.
//  Copyright © 2017年 King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKConfigure.h"

@interface BKCollectionViewCell : UICollectionViewCell

+ (instancetype)dequeueReusableCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@property (strong, nonatomic) NSIndexPath *indexPath;

- (void)createControl;

- (void)setupConstraint;

@property (strong, nonatomic) UIImageView *bk_imageView;

@property (strong, nonatomic) YYLabel *bk_textLabel;

@property (strong, nonatomic) YYLabel *bk_detailTextLabel;

@property (nonatomic) UITableViewCellAccessoryType bk_accessoryType;

@property (strong, nonatomic) UIImageView *bk_indicator;

@property (strong, nonatomic) UITextField *bk_textField;

+ (CGSize)size;

@end
