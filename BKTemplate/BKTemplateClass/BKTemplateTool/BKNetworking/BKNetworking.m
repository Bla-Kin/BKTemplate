//
//  BKNetworking.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/31.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKNetworking.h"

@implementation BKNetworking

+ (BOOL)isExistenceNetwork {
    // 开启监听网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 网络状态
    BKNetworking *networkModel = [BKNetworking networkModel];
    
    // 关闭网络状态监听
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
    
    return networkModel.isReachable;
}

+ (void)isExistenceNetwork:(NetworkingBlock)isExistence {
    
    // 开启监听网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 监听网络状态回调
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        // 开启网络状态监听后，只要网络状态发生改变就会调用该 Block 代码段
        // 网络状态
        BKNetworking *networkModel = [BKNetworking networkModel];
        
        // 关闭网络状态监听
        [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
        
        if (isExistence) {
            isExistence(networkModel);
        }
    }];
}

+ (BKNetworking *)networkModel {
    
    //初始化网络状态
    BKNetworking *networkModel = [BKNetworking new];
    
    // 判断网络是否连接
    networkModel.isReachable = [AFNetworkReachabilityManager sharedManager].isReachable;
    
    // 判断 WiFi 是否连接
    networkModel.isReachableViaWiFi = [AFNetworkReachabilityManager sharedManager].isReachableViaWiFi;
    
    // 判断 无线网络 是否连接
    networkModel.isReachableViaWWAN = [AFNetworkReachabilityManager sharedManager].isReachableViaWWAN;
    
    // 获取网络连接状态
    networkModel.netStatus = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    
    return networkModel;
}

@end
