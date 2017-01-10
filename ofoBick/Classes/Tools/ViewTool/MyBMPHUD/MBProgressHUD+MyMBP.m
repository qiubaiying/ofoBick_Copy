//
//  MBProgressHUD+MyMBP.m
//  PandaEvents
//
//  Created by wade on 16/7/19.
//  Copyright © 2016年 wade. All rights reserved.
//

#import "MBProgressHUD+MyMBP.h"


#define sUCCESSDelay 2.0f
#define mSGDelay     2.3f

@implementation MBProgressHUD (MyMBP)

//+ (MBProgressHUD *)showMessage:(NSString *)message
//{
//    return [self showMessage:message toView:nil];
//}
//
//+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
//    // 快速显示一个提示信息
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.userInteractionEnabled = NO;
//    hud.label.text = message;
//    hud.label.numberOfLines = 0;
//    //hud.label.textColor = [UIColor whiteColor];
//    hud.label.font = [UIFont systemFontOfSize:14];
//    // 隐藏时候从父控件中移除
//    hud.removeFromSuperViewOnHide = YES;
//    hud.mode = MBProgressHUDModeText;
//
//    // YES代表需要蒙版效果
//    //hud.dimBackground = YES;
//    //一秒消失
//    //[hud hide:YES afterDelay:2];
//    //hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.9];
//    [hud hideAnimated:YES afterDelay:2];
//    
//    
//    
//    return hud;
//}

//+(MBProgressHUD *)showHudWithView:(id)view
//{
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.removeFromSuperViewOnHide = YES;
//    
//    return hud;
//}


/**
 *  显示信息
 *
 *  @param text 信息内容
 *  @param icon 图标
 *  @param view 显示的视图
 */
+ (void)_show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    [self hideHUD];
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.mode = MBProgressHUDModeCustomView;

    hud.labelText = text;
    
    hud.userInteractionEnabled = NO;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    
    
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 设置消失时间
    [hud hide:YES afterDelay:sUCCESSDelay];
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 */
+ (void)showSuccess:(NSString *)success
{
    
    [self showSuccess:success toView:nil];
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 *  @param view    显示信息的视图
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self _show:success icon:@"success.png" view:view];
}

/**
 *  显示错误信息
 *
 */
+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

/**
 *  显示错误信息
 *
 *  @param error 错误信息内容
 *  @param view  需要显示信息的视图
 */
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self _show:error icon:@"error.png" view:view];
}

/**
 *  显示一些信息
 *
 *  @param message 信息内容
 */
+ (void )showMessage:(NSString *)message{
    [self showMessage:message toView:nil];
}

/**
 *  显示一些信息
 *
 *  @param message 信息内容
 *  @param view    需要显示信息的视图
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (void)showMessage:(NSString *)message toView:(UIView *)view {
    
    [self hideHUD];
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = message;
    hud.detailsLabelFont = [UIFont systemFontOfSize:13.f];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    
    [hud hide:YES afterDelay:mSGDelay];
}



+ (MBProgressHUD *)showWait {
    return [self showWaitWithMessage:nil toView:nil];
}

+(MBProgressHUD *)showWaitWithMessage:(NSString *)message {
    return [self showWaitWithMessage:message toView:nil];
}

+ (MBProgressHUD *)showWaitWithMessage:(NSString *)message toView:(UIView *)view{

    [self hideHUD];
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.mode = MBProgressHUDModeIndeterminate;
    
    if (message != nil) hud.labelText = message;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    hud.userInteractionEnabled = YES;
    
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    
    return hud;
}

/**
 *  手动关闭MBProgressHUD
 */
+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

/**
 *  手动关闭MBProgressHUD
 *
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

@end
