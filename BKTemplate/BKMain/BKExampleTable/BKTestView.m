//
//  BKTestView.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/31.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKTestView.h"

@implementation BKTestView
{
    UIButton *_button;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [super setupView];
    
    _label = [YYLabel new];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font =  System_Font(13.f);
    [self addSubview:_label];
    
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    [_button setTitle:@"这是按钮" forState:(UIControlStateNormal)];
    [_button setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [_button setBackgroundColor:[UIColor whiteColor]];
    [_button.titleLabel setFont:System_Font(14.f)];
    
    [_button addTarget:self action:@selector(buttonClickEvent) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self addSubview:_button];
}

- (void)buttonClickEvent {
    if (_delegate && [_delegate respondsToSelector:@selector(testDelegate)]) {
        [_delegate testDelegate];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _button.layer.borderColor = [UIColor redColor].CGColor;
    _button.layer.borderWidth = 1.f;
    _button.layer.cornerRadius = 40.f;
    _button.layer.masksToBounds = YES;
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        
        make.centerY.equalTo(@0);
        
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        
        make.right.equalTo(@-15);
        
        make.bottom.equalTo(_button.mas_top).offset(-50);
    }];
}

@end
