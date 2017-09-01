//
//  BKDefaultPageView.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/6/5.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKView.h"

typedef void(^DefaultPageBlock)(void);

@interface BKDefaultPageView : BKView

@property (strong, nonatomic) UIImageView *defaultPageImageView;

@property (strong, nonatomic) UILabel *defaultPageLabel;

@property (strong, nonatomic) UIButton *defaultPageButton;

@property (copy, nonatomic) DefaultPageBlock defaultPageBlock;

- (void)defaultPageBlock:(DefaultPageBlock)defaultPageBlock;

@end
