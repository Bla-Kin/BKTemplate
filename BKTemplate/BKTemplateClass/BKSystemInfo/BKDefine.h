//
//  BKDefine.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/29.
//  Copyright © 2017年 King. All rights reserved.
//

#ifndef BKDefine_h
#define BKDefine_h

#pragma mark - 其他

#define Distribution    NO

#pragma mark - 颜色

/**
 创建颜色
 
 @param __red__ 红色
 @param __green__ 绿色
 @param __blue__ 蓝色
 @return 不带透明度的颜色
 */
#ifndef RGB
#define RGB(__red__, __green__, __blue__)\
RGBA(__red__, __green__, __blue__, 1.f)
#endif

/**
 创建颜色与透明度
 
 @param __red__ 红色
 @param __green__ 绿色
 @param __blue__ 蓝色
 @param __alpha__ 透明度
 @return 带透明度的颜色
 */
#ifndef RGBA
#define RGBA(__red__, __green__, __blue__, __alpha__)\
[UIColor colorWithRed:__red__/255.0f green:__green__/255.0f blue:__blue__/255.0f alpha:__alpha__]
#endif

/**
 设置颜色透明度
 
 @param __color__ 颜色
 @param __alpha__ 透明度
 @return 带透明度的颜色
 */
#ifndef Alpha
#define Alpha(__color__, __alpha__)\
[__color__ colorWithAlphaComponent:__alpha__]
#endif

#ifndef Random_Color
#define Random_Color RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#endif

#pragma mark - 字体

/**
 设置系统字体大小
 
 @param __float__ 尺寸
 @return 系统字体
 */
#ifndef System_Font
#define System_Font(__float__)\
[UIFont systemFontOfSize:__float__]
#endif

/**
 设置系统粗体字体大小
 
 @param __float__ 尺寸
 @return 粗体系统字体
 */
#ifndef Bold_Font
#define Bold_Font(__float__)\
[UIFont boldSystemFontOfSize:__float__]
#endif

/**
 自定义字体
 
 @param __name__ 字体名称
 @param __float__ 尺寸
 @return 自定义字体
 */
#ifndef Custom_Font
#define Custom_Font(__name__, __float__)\
[UIFont fontWithName:__name__ size:__float__]
#endif

#pragma mark - 图片

/**
 获取图片
 
 @param __name__ 图片名称
 @return 图片
 */
#ifndef Image_Name
#define Image_Name(__name__)\
[UIImage imageNamed:__name__]
#endif

/**
 获取纯色图片
 
 @param __color__ 颜色
 @return 颜色图片
 */
#ifndef Image_Color
#define Image_Color(__color__)\
[UIImage imageWithColor:__color__]
#endif

#pragma mark - 设备

/**
 获取屏幕宽度
 
 @return 屏幕宽度
 */
#ifndef Screen_Width
#define Screen_Width     kScreenWidth
#endif

/**
 获取屏幕高度
 
 @return 屏幕高度
 */
#ifndef Screen_Height
#define Screen_Height    kScreenHeight
#endif

/**
 根据屏宽计算数值
 
 @param __float__ 未计算数值
 @return 数值
 */
#ifndef Layout_Width
#define Layout_Width(__float__)\
__float__ * Screen_Width / 320.0
#endif

/**
 根据高度计算数值
 
 @param __float__ 未计算数值
 @return 数值
 */
#ifndef Layout_Height
#define Layout_Height(__float__)\
__float__ * Screen_Height / 568.0
#endif


/**
 设备相关
 */
#define IPad     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IPhone   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define Retina   ([[UIScreen mainScreen] scale] >= 2.0)

#define BK_MAX_Length   (MAX(Screen_Width, Screen_Height))
#define BK_MIN_Length   (MIN(Screen_Width, Screen_Height))

#define IPhone_4     (IPhone && BK_MAX_Length < 568.0)
#define IPhone_5     (IPhone && BK_MAX_Length == 568.0)
#define IPhone_6     (IPhone && BK_MAX_Length == 667.0)
#define IPhone_6P    (IPhone && BK_MAX_Length == 736.0)

#pragma mark - 打印

#ifdef DEBUG
#define BKLog(...)  NSLog(@"\n%s\n%@\n\n", __func__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define BKLog(...)
#endif

#endif /* BKDefine_h */
