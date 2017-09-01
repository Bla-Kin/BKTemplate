//
//  BKNetworking.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/31.
//  Copyright © 2017年 King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKRequestManager.h"

@class BKNetworking;

typedef void(^NetworkingBlock)(BKNetworking *networkModel);

@interface BKNetworking : NSObject

/**
 网络是否连接
 */
@property (assign, nonatomic) BOOL isReachable;

/**
 WiFi是否连接
 */
@property (assign, nonatomic) BOOL isReachableViaWiFi;

/**
 无线网络是否连接
 */
@property (assign, nonatomic) BOOL isReachableViaWWAN;

/**
 网络连接状态
 */
@property (assign, nonatomic) AFNetworkReachabilityStatus netStatus;

/**
 检测网络
 
 @return 是否有网
 */
+ (BOOL)isExistenceNetwork;

/**
 检测网络
 
 @param isExistence 是否有网
 */
+ (void)isExistenceNetwork:(NetworkingBlock)isExistence;

@end
