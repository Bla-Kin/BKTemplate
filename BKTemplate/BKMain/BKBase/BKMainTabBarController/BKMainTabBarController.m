//
//  BKMainTabBarController.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/6/5.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKMainTabBarController.h"
#import "BKMainNavigationController.h"
#import "BKMainViewController.h"

@interface BKMainTabBarController ()

@end

@implementation BKMainTabBarController

- (void)setupTabBarController {
    [super setupTabBarController];
    
    BKMainViewController *mainVC = [[BKMainViewController alloc] init];
    BKMainNavigationController *homeNC = [BKMainNavigationController viewController:mainVC title:@"首页" normalImage:nil selectedImage:nil];
    [self addChildViewController:homeNC];
}

@end
