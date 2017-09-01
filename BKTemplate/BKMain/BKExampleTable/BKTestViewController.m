//
//  BKTestViewController.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/29.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKTestViewController.h"
#import "BKTestView.h"

void (^BKLogBlock)(id weakSelf) = ^(id weakSelf){
    BKLog(@"点击按钮%@", weakSelf);
};

@interface BKTestViewController () <BKTestViewDelegate>

@end

@implementation BKTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    BKTestView *testView = [[BKTestView alloc] init];
    testView.delegate = self;
    [self.view addSubview:testView];
    
    [testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

- (void)testDelegate {
    __weak typeof(self) weakSelf = self;
    BKLogBlock(weakSelf);
}

@end
