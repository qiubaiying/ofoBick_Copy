//
//  CheckTimer.m
//  TTS-LITE
//
//  Created by wade on 16/12/29.
//  Copyright © 2016年 wade. All rights reserved.
//

#import "CheckTimer.h"

dispatch_source_t checktimer;

@interface CheckTimer ()

@end

@implementation CheckTimer

singleton_implementation(CheckTimer)

//- (void)startCheckTimerWithBlock:(TimerBlock)timerBlock {
//    
//    [self _timerAction];
//    [self.timer invalidate];
//    self.timer = nil;
//    
//    [self performSelectorOnMainThread:@selector(openTimer) withObject:nil waitUntilDone:NO];
//    _timerBlock = timerBlock;
//    
//}
//
//- (void)openTimer {
//    
//    self.timer = [NSTimer timerWithTimeInterval:60 target:self selector:@selector(_timerAction) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
//}
//
//- (void)_timerAction {
//    if (self.timerBlock) {
//        self.timerBlock();
//    }
//}
//
//- (void)stopCheckTimer {
//    
//    [self.timer invalidate];
//}


- (void)startGCDCheckTimerOnGlobalQueueWithInterval:(int)interval Blcok:(CheckTimerBlock)timerBlcok {
    
    if (!interval) interval = 1;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    checktimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(checktimer, dispatch_walltime(NULL, 0), interval * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(checktimer, ^{
        
        if (timerBlcok) {
            
            timerBlcok();
        }
        
        
    });
    
    // 开启定时器
    dispatch_resume(checktimer);
    
    
}

- (void)startGCDCheckTimerOnMainQueueWithInterval:(int)interval Blcok:(CheckTimerBlock)timerBlcok {
    
    if (!interval) interval = 1;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    checktimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(checktimer, dispatch_walltime(NULL, 0), interval * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(checktimer, ^{
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (timerBlcok) {
                
                timerBlcok();
            }
            
        });
        
        
    });
    
    // 开启定时器
    dispatch_resume(checktimer);
}

- (void)stopGCDCheckTimer {
    
    if(checktimer)
    {
        dispatch_source_cancel(checktimer);
    }
    
}


@end
