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

@property (strong, nonatomic) BKTestView *testView;

@end

@implementation BKTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _testView = [[BKTestView alloc] init];
    _testView.delegate = self;
    [self.view addSubview:_testView];
    
    [_testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    @weakify(self);
    [BKSystem cacheSize:^(CGFloat cacheSize) {
        @strongify(self);
        self.testView.label.text = [NSString stringWithFormat:@"%.2f", cacheSize];
    }];
    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
//    
//    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    
//    [alertController addAction:confirmAction];
//    [alertController addAction:cancelAction];
//    
//    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)testDelegate {
//    __weak typeof(self) weakSelf = self;
//    BKLogBlock(weakSelf);
    
//    @weakify(self);
//    [BKSystem clearCache:^{
//        @strongify(self);
//        self.testView.label.text = [NSString stringWithFormat:@"%.2f", [BKSystem cacheSize]];
//    }];
//
////    [BKProgressHUD showMessageHud:self.navigationController.view message:@"这是一段描述文字"];
//    [BKProgressHUD showLoadingHud:self.navigationController.view message:@"正在加载"];
}

@end
