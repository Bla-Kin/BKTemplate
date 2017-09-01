//
//  BKRequestManager.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/30.
//  Copyright © 2017年 King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

/**
 进度回调
 
 @param uploadProgress 进度信息
 */
typedef void(^BKRequestProgress)(NSProgress *uploadProgress);

/**
 成功回调
 
 @param task 任务信息
 @param responseObject 数据信息
 */
typedef void(^BKRequestSuccess)(NSURLSessionDataTask *task, id responseObject);

/**
 失败回调
 
 @param task 任务信息
 @param error 失败信息
 */
typedef void(^BKRequestFailure)(NSURLSessionDataTask *task, NSError *error);

@interface BKRequestManager : NSObject

+ (AFHTTPSessionManager *)requestManager;

+ (NSString *)baseUrlStr;

+ (NSDictionary *)getCommonpParameters:(NSDictionary *)parameters;

/**
 GET(无进度)
 
 @param urlString 链接地址
 @param parameters 携带参数
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)requestGet:(NSString *)urlString parameters:(id)parameters success:(BKRequestSuccess)success failure:(BKRequestFailure)failure;

/**
 GET(有进度)
 
 @param urlString 链接地址
 @param parameters 携带参数
 @param progress 进度回调
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)requestGet:(NSString *)urlString parameters:(id)parameters progress:(BKRequestProgress)progress success:(BKRequestSuccess)success failure:(BKRequestFailure)failure;

/**
 POST(无进度)
 
 @param urlString 链接地址
 @param parameters 携带参数
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)requestPost:(NSString *)urlString parameters:(id)parameters success:(BKRequestSuccess)success failure:(BKRequestFailure)failure;

/**
 POST(有进度)
 
 @param urlString 链接地址
 @param parameters 携带参数
 @param progress 进度回调
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)requestPost:(NSString *)urlString parameters:(id)parameters progress:(BKRequestProgress)progress success:(BKRequestSuccess)success failure:(BKRequestFailure)failure;

/**
 POST(上传)
 
 @param urlString 链接地址
 @param parameters 携带参数
 @param block 数据信息
 @param progress 進度信息
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)requestPost:(NSString *)urlString parameters:(id)parameters constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block progress:(BKRequestProgress)progress success:(BKRequestSuccess)success failure:(BKRequestFailure)failure;

@end
