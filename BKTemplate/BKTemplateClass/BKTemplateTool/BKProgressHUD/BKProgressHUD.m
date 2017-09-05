//
//  BKProgressHUD.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/9/4.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKProgressHUD.h"
#import "BKConfigure.h"

#define BKHudTitleColor     [UIColor whiteColor]

#define BKHudBezelColor     [UIColor blackColor]

@implementation BKProgressHUD

#pragma mark - 创建

+ (void)baseSetting:(MBProgressHUD *)hud {
    hud.label.font = !IPhone_6P ? Bold_Font(13.f) : Bold_Font(14.f);
    
    hud.contentColor = BKHudTitleColor;
    
    hud.bezelView.color = BKHudBezelColor;
    
    hud.margin = 10.f;
    
    hud.offset = CGPointMake(0.f, -32.f);
}

#pragma mark - 展示

+ (void)showMessageHud:(UIView *)view message:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.label.text = message;
        
        [self baseSetting:hud];
        
        [hud hideAnimated:YES afterDelay:1.f];
    });
}

+ (void)showLoadingHud:(UIView *)view message:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        
        hud.mode = MBProgressHUDModeIndeterminate;
        
        hud.label.text = message;
        
        [self baseSetting:hud];
        
        [hud hideAnimated:YES afterDelay:10.f];
    });
}

#pragma mark - 隐藏

+ (void)hideProgressHud:(UIView *)view {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:view animated:YES];
    });
}

@end

//  模糊效果    line:1164
