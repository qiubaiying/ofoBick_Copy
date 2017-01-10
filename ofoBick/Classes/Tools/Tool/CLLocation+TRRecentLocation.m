//
//  CLLocation+TRRecentLocation.m
//  HLStore
//
//  Created by wade on 16/6/17.
//  Copyright © 2016年 wade. All rights reserved.
//

#import "CLLocation+TRRecentLocation.h"

static NSTimeInterval const TRRecentLocationMaximumElapsedTimeInterval = 5;

@implementation CLLocation (TRRecentLocation)

- (BOOL)isStale
{
    return [self elapsedTimeInterval] > TRRecentLocationMaximumElapsedTimeInterval;
}

- (NSTimeInterval)elapsedTimeInterval
{
    return [[NSDate date] timeIntervalSinceDate:self.timestamp];
}


@end
