//
//  BKViewController.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/5/31.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKViewController.h"

@interface BKViewController ()

@end

@implementation BKViewController

/*
 界面相关
 1.创建界面检测网络
 -有网络执行
 -无网络停止
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    @weakify(self);
    [BKNetworking isExistenceNetwork:^(BKNetworking *networkModel) {
        @strongify(self);
        if (networkModel.isReachable) {
            [self bk_viewDidLoad];
            NSLog(@"有网络");
        } else {
            NSLog(@"无网络");
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self bk_viewWillAppear];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self bk_viewDidAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self bk_viewWillDisappear];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self bk_viewDidAppear];
}

- (void)bk_viewDidLoad {}

- (void)bk_viewWillAppear {}

- (void)bk_viewDidAppear {}

- (void)bk_viewWillDisappear {}

- (void)bk_viewDidDisappear {}

- (void)dealloc {
    BKLog(@"释放了");
}

@end
///**
// 加载视图
// */
//- (void)bk_viewDidLoad;
//
///**
// 即将加入
// */
//- (void)bk_viewWillAppear;
//
///**
// 已经加入
// */
//- (void)bk_viewDidAppear;
//
///**
// 即将消失
// */
//- (void)bk_viewWillDisappear;
//
///**
// 已经消失
// */
//- (void)bk_viewDidDisappear;
