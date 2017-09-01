//
//  BKTabBarController.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/6/5.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKTabBarController.h"

@interface BKTabBarController ()

@end

@implementation BKTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupTabBarController];
    }
    return self;
}

- (void)setupTabBarController {
    UIColor *tabBarNormalColor = [[UIColor blackColor] colorWithAlphaComponent:0.6f];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : tabBarNormalColor} forState:UIControlStateNormal];
    
    UIColor *tabBarSelectedColor = [UIColor blackColor];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : tabBarSelectedColor} forState:UIControlStateSelected];
}

- (void)addChildViewController:(BKViewController *)viewController
                         title:(NSString *)title
                   normalImage:(NSString *)normalImage
                 selectedImage:(NSString *)selectedImage {
    
    // 设置导航栏和底部控制器Title
    viewController.title = title;
    
    //  设置图片
    viewController.tabBarItem.image = [UIImage imageNamed:normalImage];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //  添加一个导航控制器
    BKNavigationController *navigationController = [[BKNavigationController alloc] initWithRootViewController:viewController];
    
    //  添加为子控制器
    [self addChildViewController:navigationController];
}

@end
