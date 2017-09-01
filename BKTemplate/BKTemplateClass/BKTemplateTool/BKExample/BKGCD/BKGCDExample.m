//
//  BKGCDExample.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/23.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKGCDExample.h"

@implementation BKGCDExample
{
    dispatch_queue_t main_queue;
    dispatch_queue_t serial_queue;
    dispatch_queue_t concurrent_queue;
}

- (void)GCD_mainMethod {
    // 主线程获取方法
    main_queue = dispatch_get_main_queue();
    // 串行队列的创建方法    串行:DISPATCH_QUEUE_SERIAL
    serial_queue = dispatch_queue_create("test.serial.queue", DISPATCH_QUEUE_SERIAL);
    // 并行队列的创建方法    并行:DISPATCH_QUEUE_CONCURRENT
    concurrent_queue = dispatch_queue_create("test.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    
    //  1.主队列 + 同步执行    没有开启新线程，串行执行任务
    [self GCD_Sync_Main];
    
    //  2.主队列 + 异步执行    没有开启新线程，串行执行任务
    [self GCD_Async_Main];
    
    //  1.并行队列 + 同步执行   没有开启新线程，串行执行任务
    [self GCD_Sync_Concurrent];
    
    //  2.并行队列 + 异步执行   有开启新线程，并行执行任务
    [self GCD_Async_Concurrent];
    
    //  3.串行队列 + 同步执行   没有开启新线程，串行执行任务
    [self GCD_Sync_Serial];
    
    //  4.串行队列 + 异步执行   有开启新线程(1条)，串行执行任务
    [self GCD_Async_Serial];
    
    //  获取全局并行队列 + 异步执行 + 回调主线程（常用）
    [self GCD_Communicate_Method];
    
    //  栅栏
    [self GCD_Barrier_Method];
    
    //  延时
    [self GCD_After_Method];
    
    //  迭代（循环）
    [self GCD_Apply_Method];
    
    //  队列组
    [self GCD_Group_Method];
}

#pragma mark - 基础
- (void)GCD_Sync_Main {
    //  互等卡住不可行(在主线程中调用)
    NSLog(@"GCD sync main-----begin");
    
    dispatch_async(concurrent_queue, ^{
        dispatch_sync(main_queue, ^{
            for (int i = 0; i < 2; ++i) {
                NSLog(@"5-1-----%@", [NSThread currentThread]);
            }
        });
        
        dispatch_sync(main_queue, ^{
            for (int i = 0; i < 2; ++i) {
                NSLog(@"5-2-----%@", [NSThread currentThread]);
            }
        });
        
        dispatch_sync(main_queue, ^{
            for (int i = 0; i < 2; ++i) {
                NSLog(@"5-3-----%@", [NSThread currentThread]);
            }
        });
    });
    
    NSLog(@"GCD sync main-----end");
}

- (void)GCD_Async_Main {
    //  只在主线程中执行任务，执行完一个任务，再执行下一个任务
    NSLog(@"GCD async main-----begin");
    
    dispatch_async(main_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"6-1-----%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(main_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"6-2-----%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(main_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"6-3-----%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"GCD async main-----end");
}

- (void)GCD_Sync_Concurrent {
    NSLog(@"GCD sync concurrent-----begin");
    
    //  不会开启新线程，执行完一个任务，再执行下一个任务
    dispatch_sync(concurrent_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"1-1-----%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(concurrent_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"1-2-----%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(concurrent_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"1-3-----%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"GCD sync concurrent-----end");
}

- (void)GCD_Async_Concurrent {
    NSLog(@"GCD async concurrent-----begin");
    
    //  可同时开启多线程，任务交替执行
    dispatch_async(concurrent_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"2-1-----%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(concurrent_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"2-2-----%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(concurrent_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"2-3-----%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"GCD async concurrent-----end");
}

- (void)GCD_Sync_Serial {
    NSLog(@"GCD sync serial-----begin");
    
    //  不会开启新线程，在当前线程执行任务。任务是串行的，执行完一个任务，再执行下一个任务
    dispatch_sync(serial_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"3-1-----%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(serial_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"3-2-----%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(serial_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"3-3-----%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"GCD sync serial-----end");
}

- (void)GCD_Async_Serial {
    NSLog(@"GCD async serial-----begin");
    
    //  会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务
    dispatch_async(serial_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"4-1-----%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(serial_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"4-2-----%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(serial_queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"4-3-----%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"GCD async serial-----end");
}

#pragma mark - 常用
- (void)GCD_Communicate_Method {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"7-1-----%@", [NSThread currentThread]);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"7-2-----%@", [NSThread currentThread]);
        });
    });
}

#pragma mark - 其他
- (void)GCD_Barrier_Method {
    concurrent_queue = dispatch_queue_create("test.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(concurrent_queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"1-%d-----%@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(concurrent_queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"2-%d-----%@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_barrier_async(concurrent_queue, ^{
        NSLog(@"-----barrier-----%@", [NSThread currentThread]);
    });
    
    dispatch_async(concurrent_queue, ^{
        NSLog(@"3-----%@", [NSThread currentThread]);
    });
    
    dispatch_async(concurrent_queue, ^{
        NSLog(@"4-----%@", [NSThread currentThread]);
    });
}

- (void)GCD_After_Method {
    NSLog(@"开始执行");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //  延时2秒后执行
        NSLog(@"run-----");
    });
}

- (void)GCD_Apply_Method {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_apply(6, queue, ^(size_t index) {
        NSLog(@"%zd------%@", index, [NSThread currentThread]);
    });
}

- (void)GCD_Group_Method {
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"1-%d-----%@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"2-%d-----%@", i, [NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"3-----%@", [NSThread currentThread]);
    });
}

@end
