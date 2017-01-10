//
//  CheckTimer.h
//  TTS-LITE
//
//  Created by wade on 16/12/29.
//  Copyright © 2016年 wade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

typedef void(^CheckTimerBlock)();

@interface CheckTimer : NSObject

singleton_interface(CheckTimer)

- (void)startGCDCheckTimerOnGlobalQueueWithInterval:(int)interval Blcok:(CheckTimerBlock)timerBlcok ;

- (void)startGCDCheckTimerOnMainQueueWithInterval:(int)interval Blcok:(CheckTimerBlock)timerBlcok;

- (void)stopGCDCheckTimer;

@end
