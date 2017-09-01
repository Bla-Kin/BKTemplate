//
//  BKTestView.h
//  BKTemplate
//
//  Created by 优选智胜 on 2017/8/31.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKView.h"

@protocol BKTestViewDelegate <NSObject>

- (void)testDelegate;

@end

@interface BKTestView : BKView

@property (weak, nonatomic) id <BKTestViewDelegate> delegate;

@end
