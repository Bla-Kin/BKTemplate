//
//  BKNavigationController.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/6/5.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKNavigationController.h"

@interface BKNavigationController ()

@end

@implementation BKNavigationController

+ (instancetype)viewController:(BKViewController *)viewController title:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage {
    
    // 设置导航栏和底部控制器Title
    viewController.title = title;
    
    //  设置图片
    viewController.tabBarItem.image = [UIImage imageNamed:normalImage];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return [[self alloc] initWithRootViewController:viewController];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        //        UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:Image_Name(@"navigationbar_back") style:(UIBarButtonItemStyleDone) target:self action:@selector(backBtnClickEvent:)];
        //
        //        viewController.navigationItem.leftBarButtonItem = backBtn;
    }
    
    [super pushViewController:viewController animated:animated];
}

//- (void)backBtnClickEvent:(UIButton *)backBtn {
//    [self popViewControllerAnimated:YES];
//}
//
//- (UIViewController *)childViewControllerForStatusBarStyle {
//    return self.topViewController;
//}

@end
