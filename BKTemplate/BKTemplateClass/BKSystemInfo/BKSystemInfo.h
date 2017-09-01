//
//  BKSystemInfo.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/6/5.
//  Copyright © 2017年 King. All rights reserved.
//

#import <Foundation/Foundation.h>

#define REQUEST_SUCCESS 100

#define REQUEST_CODE [responseObject[@"resultCode"] intValue]

#define REQUEST_MSG responseObject[@"resultDesc"]

#define REQUEST_ISEQUAL REQUEST_CODE == REQUEST_SUCCESS

#define REQUEST_ISUNEQUAL REQUEST_CODE != REQUEST_SUCCESS

#define ContentView    self.contentView

@interface BKSystemInfo : NSObject

+ (NSString *)platform;

@end
