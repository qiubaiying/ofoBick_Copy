//
//  BYTimer.h
//  TTS-LITE
//
//  Created by Jack on 16/12/13.
//  Copyright © 2016年 wade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

typedef void(^TimerBlock)();

@interface BYTimer : NSObject

singleton_interface(BYTimer)


/**
 CGD定时器 回调方法在 主线程 中执行

 @param interval 定时间隔
 @param timerBlcol 回调
 */
- (void)startGCDTimerOnMainQueueWithInterval:(int)interval Blcok:(TimerBlock)timerBlcok;


/**
 CGD定时器 回调方法在 子线程 中执行

 @param interval 定时间隔
 @param timerBlcol 回调
 */
- (void)startGCDTimerOnGlobalQueueWithInterval:(int)interval Blcok:(TimerBlock)timerBlcol;

/** 停止定时器 */
- (void)stopGCDTimer;

@end
