//
//  BKRequestManager.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/30.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKRequestManager.h"
#import "BKDefine.h"

@implementation BKRequestManager

#pragma mark - 网络请求单例
+ (AFHTTPSessionManager *)requestManager {
    static AFHTTPSessionManager *_requestManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _requestManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[BKRequestManager baseUrlStr]]];
        
        _requestManager.requestSerializer.timeoutInterval = 15.f;
        _requestManager.requestSerializer.HTTPShouldHandleCookies = YES;
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
        responseSerializer.removesKeysWithNullValues = YES;
        _requestManager.responseSerializer = responseSerializer;
        
        NSMutableSet *acceptContentTypes = [NSMutableSet setWithSet:_requestManager.responseSerializer.acceptableContentTypes];
        
        [acceptContentTypes addObject:@"text/html"];
        [acceptContentTypes addObject:@"text/plain"];
        [acceptContentTypes addObject:@"text/javascript"];
        [acceptContentTypes addObject:@"application/json"];
        [acceptContentTypes addObject:@"application/octet-stream"];
        [acceptContentTypes addObject:@"image/png"];
        [acceptContentTypes addObject:@"image/jpeg"];
        
        _requestManager.responseSerializer.acceptableContentTypes = acceptContentTypes;
    });
    return _requestManager;
}

#pragma mark    公共方法
+ (NSString *)baseUrlStr {
#ifdef DEBUG
    if (!Distribution) {
        return @"http://120.27.53.49:8070";
    }
#endif
    return @"http://letdb.com/";
}

+ (NSDictionary *)getCommonpParameters:(NSDictionary *)parameters {
    
    NSMutableDictionary *commonpParameters = [NSMutableDictionary dictionary];
    [commonpParameters addEntriesFromDictionary:parameters];
    
    //添加公共参数
    
    return commonpParameters;
}

#pragma mark - 获取网络数据
+ (void)requestGet:(NSString *)urlString parameters:(id)parameters success:(BKRequestSuccess)success failure:(BKRequestFailure)failure {
    
    [BKRequestManager requestGet:urlString parameters:parameters progress:nil success:success failure:failure];
}

+ (void)requestGet:(NSString *)urlString parameters:(id)parameters progress:(BKRequestProgress)progress success:(BKRequestSuccess)success failure:(BKRequestFailure)failure {
    
    NSDictionary *commonpParameters = [BKRequestManager getCommonpParameters:parameters];
    
    [[BKRequestManager requestManager] GET:urlString parameters:commonpParameters progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

+ (void)requestPost:(NSString *)urlString parameters:(id)parameters success:(BKRequestSuccess)success failure:(BKRequestFailure)failure {
    
    [BKRequestManager requestPost:urlString parameters:parameters progress:nil success:success failure:failure];
}

+ (void)requestPost:(NSString *)urlString parameters:(id)parameters progress:(BKRequestProgress)progress success:(BKRequestSuccess)success failure:(BKRequestFailure)failure {
    
    NSDictionary *commonpParameters = [BKRequestManager getCommonpParameters:parameters];
    
    [[BKRequestManager requestManager] POST:urlString parameters:commonpParameters progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

+ (void)requestPost:(NSString *)urlString parameters:(id)parameters constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block progress:(BKRequestProgress)progress success:(BKRequestSuccess)success failure:(BKRequestFailure)failure {
    
    NSDictionary *commonpParameters = [BKRequestManager getCommonpParameters:parameters];
    
    [[BKRequestManager requestManager] POST:urlString parameters:commonpParameters constructingBodyWithBlock:block progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

@end
