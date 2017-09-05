//
//  BKSystem.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/9/1.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKSystem.h"
#import "BKConfigure.h"

@implementation BKSystem

#pragma mark - 字符判空

+ (BOOL)emptyString:(NSString *)string {
    if (string == nil ||
        string == NULL ||
        [string isEqual:NULL] ||
        [string isEqual:@"NULL"] ||
        [string isEqual:[NSNull null]] ||
        [string isKindOfClass:[NSNull class]] ||
        [string isEqualToString:@"<null>"] ||
        [string isEqualToString:@"(null)"] ||
        [[string class] isSubclassOfClass:[NSNull class]] ||
        [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
    {
        return YES;
    }
    return NO;
}

#pragma mark - 验证

+ (BOOL)validateIdentify:(NSString *)identify {
    if ([BKSystem emptyString:identify]) return NO;
    NSString *regEx = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identifyPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [identifyPredicate evaluateWithObject:identify];
}

+ (BOOL)validateMobileNum:(NSString *)mobileNum {
    if ([BKSystem emptyString:mobileNum]) return NO;
    return mobileNum.length == 11 ? YES : NO;
}

+ (BOOL)validateEmail:(NSString *)email {
    if ([BKSystem emptyString:email]) return NO;
    NSString *regEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [emailPredicate evaluateWithObject:email];
}

#pragma mark - 缓存

+ (CGFloat)cacheSize {
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    
    __block unsigned long long cacheSize = 0.0f;
    
    [files enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@", obj]];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            cacheSize += [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil].fileSize;
        }
    }];
    
    return cacheSize / (1024.f * 1024.f);
}

+ (void)cacheSize:(void (^)(CGFloat cacheSize))block {
    [BKProgressHUD showLoadingHud:[UIApplication sharedApplication].keyWindow message:load_title];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
        
        __block unsigned long long cacheSize = 0.0f;
        
        [files enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@", obj]];
            
            if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
                cacheSize += [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil].fileSize;
            }
        }];
        
        sleep(1);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [BKProgressHUD hideProgressHud:[UIApplication sharedApplication].keyWindow];
            
            if (block) {
                block(cacheSize / (1024.f * 1024.f));
            }
        });
    });
}

+ (void)clearCache:(void(^)(void))block {
    
    [BKProgressHUD showLoadingHud:[UIApplication sharedApplication].keyWindow message:cache_clear];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
        
        [files enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@", obj]];
            
            NSError *error = nil;
            
            if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
                [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
            }
        }];
        
        sleep(1);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [BKProgressHUD hideProgressHud:[UIApplication sharedApplication].keyWindow];
            
            [BKProgressHUD showMessageHud:[UIApplication sharedApplication].keyWindow message:cache_clear_result];
            
            if (block) {
                block();
            }
        });
    });
}

@end
