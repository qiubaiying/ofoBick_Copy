//
//  MBProgressHUD+MyMBP.h
//  PandaEvents
//
//  Created by wade on 16/7/19.
//  Copyright © 2016年 wade. All rights reserved.
//

//#import <MBProgressHUD/MBProgressHUD.h>
#import "MBProgressHUD.h"

@interface MBProgressHUD (MyMBP)

//+ (MBProgressHUD *)showMessage:(NSString *)message;
//
//+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

//+ (MBProgressHUD *)showHudWithView:(id)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (void )showMessage:(NSString *)message;
+ (void )showMessage:(NSString *)message toView:(UIView *)view;

+ (MBProgressHUD *)showWait;
+ (MBProgressHUD *)showWaitWithMessage:(NSString *)message;
+ (MBProgressHUD *)showWaitWithMessage:(NSString *)message toView:(UIView *)view;


+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

@end
