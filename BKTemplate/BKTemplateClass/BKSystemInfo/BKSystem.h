//
//  BKSystem.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/9/1.
//  Copyright © 2017年 King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface BKSystem : NSObject

#pragma mark - 字符判空

+ (BOOL)emptyString:(NSString *)string;

#pragma mark - 验证

/**
 验证身份证

 @param identify 身份证号
 @return 结果
 */
+ (BOOL)validateIdentify:(NSString *)identify;

/**
 验证手机号

 @param mobileNum 手机号
 @return 结果
 */
+ (BOOL)validateMobileNum:(NSString *)mobileNum;

/**
 验证邮箱

 @param email 邮箱
 @return 结果
 */
+ (BOOL)validateEmail:(NSString *)email;

#pragma mark - 缓存

+ (CGFloat)cacheSize;

+ (void)cacheSize:(void (^)(CGFloat cacheSize))block;

+ (void)clearCache:(void(^)(void))block;

@end
