//
//  BKProgressHUD.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/9/4.
//  Copyright © 2017年 King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface BKProgressHUD : NSObject

+ (void)showMessageHud:(UIView *)view message:(NSString *)message;

+ (void)showLoadingHud:(UIView *)view message:(NSString *)message;

+ (void)hideProgressHud:(UIView *)view;

@end
