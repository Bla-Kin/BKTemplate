//
//  BKNavigationController.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/6/5.
//  Copyright © 2017年 King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKViewController.h"

@interface BKNavigationController : UINavigationController

+ (instancetype)viewController:(BKViewController *)viewController
                         title:(NSString *)title
                   normalImage:(NSString *)normalImage
                 selectedImage:(NSString *)selectedImage;

@end
