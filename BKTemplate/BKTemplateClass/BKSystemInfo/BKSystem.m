//
//  BKSystem.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/9/1.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKSystem.h"

@implementation BKSystem

+ (BOOL)validateIdentify:(NSString *)identify {
    NSString *regEx = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identifyPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [identifyPredicate evaluateWithObject:identify];
}

+ (BOOL)validateMobileNum:(NSString *)mobileNum {
    return mobileNum.length == 11 ? YES : NO;
}

+ (BOOL)validateEmail:(NSString *)email {
    NSString *regEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [emailPredicate evaluateWithObject:email];
}

+ (CGFloat)getCacheSize {
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:cachePath]) return 0;
    
    NSEnumerator *enumerator = [[fileManager subpathsAtPath:cachePath] objectEnumerator];
    
    NSString *fileName;
    
    long long folderSize = 0;
    
    while ((fileName = [enumerator nextObject]) != nil) {
        NSString *fileAbsolutePath = [cachePath stringByAppendingPathComponent:fileName];
        NSLog(@"%@", fileAbsolutePath);
        if ([fileManager fileExistsAtPath:fileAbsolutePath]) {
            folderSize += [[fileManager attributesOfItemAtPath:fileAbsolutePath error:nil] fileSize];
        }
    }
    
    return folderSize / (1024.f * 1024.f);
}

@end
