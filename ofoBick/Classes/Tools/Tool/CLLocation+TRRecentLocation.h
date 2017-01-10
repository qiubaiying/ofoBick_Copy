//
//  CLLocation+TRRecentLocation.h
//  HLStore
//
//  Created by wade on 16/6/17.
//  Copyright © 2016年 wade. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (TRRecentLocation)

@property (nonatomic, readonly) BOOL isStale;

@end
