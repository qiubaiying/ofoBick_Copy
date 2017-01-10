//
//  TRLocationController.h
//  HLStore
//
//  Created by wade on 16/6/17.
//  Copyright © 2016年 wade. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "CLLocation+TRRecentLocation.h"

@interface TRLocationController : NSObject<CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;

- (RACSignal *)requestAlwaysAuthorization;

- (RACSignal *)updateCurrentLocation;

- (BOOL)authorizationStatusEqualTo:(CLAuthorizationStatus)status;

@end
