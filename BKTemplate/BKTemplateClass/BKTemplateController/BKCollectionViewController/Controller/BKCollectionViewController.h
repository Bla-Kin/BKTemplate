//
//  BKCollectionViewController.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/6/5.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKViewController.h"
#import "BKCollectionViewCell.h"

@interface BKCollectionViewController : BKViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;

- (void)configCollectionView;

- (void)registerClass:(Class)cellClass;

@end
