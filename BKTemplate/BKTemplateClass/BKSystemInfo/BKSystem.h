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

+ (BOOL)validateIdentify:(NSString *)identify;

+ (BOOL)validateMobileNum:(NSString *)mobileNum;

+ (BOOL)validateEmail:(NSString *)email;

+ (CGFloat)getCacheSize;

@end
