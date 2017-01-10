//
//  BYTimer.m
//  TTS-LITE
//
//  Created by Jack on 16/12/13.
//  Copyright © 2016年 wade. All rights reserved.
//

#import "BYTimer.h"

dispatch_source_t timer;

@interface BYTimer ()

@end

@implementation BYTimer
singleton_implementation(BYTimer)

- (void)startGCDTimerOnGlobalQueueWithInterval:(int)interval Blcok:(TimerBlock)timerBlcok {
    
    if (!interval) interval = 1;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), interval * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(timer, ^{
        
        if (timerBlcok) {
            
            timerBlcok();
        }
            
        
    });
    
    // 开启定时器
    dispatch_resume(timer);
    

}

- (void)startGCDTimerOnMainQueueWithInterval:(int)interval Blcok:(TimerBlock)timerBlcok {
    
    if (!interval) interval = 1;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), interval * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(timer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (timerBlcok) {
                
                timerBlcok();
            }
            
        });
        
    });
    
    // 开启定时器
    dispatch_resume(timer);
}

- (void)stopGCDTimer {
    
    if(timer)
    {
        dispatch_source_cancel(timer);
    }
    
}


//- (void)openTimer {
//
//    self.timer = [NSTimer timerWithTimeInterval:300 target:self selector:@selector(_timerAction) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
//}
//
//- (void)_timerAction {
//
//    if (self.timerBlock) {
//        self.timerBlock();
//    }
//}
//
//- (void)stopTimer {
//
//    [self.timer invalidate];
//}


@end
