//
//  BKWeakTimer.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/31.
//  Copyright © 2017年 King. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BKTimerHandler)(id userInfo);

@interface BKWeakTimer : NSObject

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     target:(id)aTarget
                                   selector:(SEL)aSelector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(BKTimerHandler)block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats;

@end
