//
//  BKTabBarController.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/6/5.
//  Copyright © 2017年 King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKNavigationController.h"

@interface BKTabBarController : UITabBarController

- (void)setupTabBarController;

- (void)addChildViewController:(BKViewController *)viewController
                         title:(NSString *)title
                   normalImage:(UIImage *)normalImage
                 selectedImage:(UIImage *)selectedImage;

@end
