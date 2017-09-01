//
//  BKDefaultPageView.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/6/5.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKDefaultPageView.h"
#import <Masonry/Masonry.h>

@implementation BKDefaultPageView

- (void)setupView {
    [self setupDefaultPageView];
}

- (void)setupDefaultPageView {
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    _defaultPageButton = [[UIButton alloc] init];
    [_defaultPageButton setTitle:@"重新加载" forState:(UIControlStateNormal)];
    [_defaultPageButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [_defaultPageButton setTitleColor:RGBA(255, 255, 255, 0.3) forState:(UIControlStateHighlighted)];
    
    [_defaultPageButton.titleLabel setFont:System_Font(Layout_Width(15.f))];
    _defaultPageButton.backgroundColor = [UIColor blueColor];

    _defaultPageButton.layer.cornerRadius = 5.f;
    _defaultPageButton.layer.masksToBounds = YES;
    
    [_defaultPageButton addTarget:self action:@selector(defaultPageClickEvent) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:_defaultPageButton];
    
    [_defaultPageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        
        make.centerY.equalTo(@0);
        
        make.size.mas_equalTo(CGSizeMake(Layout_Width(100), Layout_Width(30)));
    }];

    _defaultPageLabel = [[UILabel alloc] init];
    _defaultPageLabel.text = @"网络错误，请检查网络";
    _defaultPageLabel.textColor = [UIColor blackColor];
    _defaultPageLabel.textAlignment = NSTextAlignmentCenter;
    _defaultPageLabel.font = System_Font(Layout_Width(15.f));
    [self addSubview:_defaultPageLabel];
    
    [_defaultPageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        
        make.right.equalTo(@-15);
        
        make.centerX.equalTo(@0);
        
        make.bottom.equalTo(_defaultPageButton.mas_top).with.offset(-Layout_Width(20));
    }];
    
    _defaultPageImageView = [[UIImageView alloc] init];
    _defaultPageImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_defaultPageImageView setImage:Image_Name(@"null_network")];
    [self addSubview:_defaultPageImageView];
    
    [_defaultPageImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        
        make.size.mas_equalTo(kScreenWidth / 3);
        	
        make.bottom.equalTo(_defaultPageLabel.mas_top).with.offset(-Layout_Width(20));
    }];
}

- (void)defaultPageClickEvent {
    if (_defaultPageBlock) {
        _defaultPageBlock();
    }
}

- (void)defaultPageBlock:(DefaultPageBlock)defaultPageBlock {
    _defaultPageBlock = defaultPageBlock;
}

@end
