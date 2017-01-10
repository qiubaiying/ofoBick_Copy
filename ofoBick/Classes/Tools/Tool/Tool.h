//
//  Tool.h
//  HL
//
//  Created by wade on 15/7/16.
//  Copyright (c) 2015年 Lab-Illusion. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageIO/ImageIO.h>

typedef void(^HandlerBlock)(int presentTime);
typedef void(^FinishBolck)(void);

@interface Tool : NSObject

+(void)ActionError:(NSError *)error;

+ (CGFloat)heightWithString:(NSString *)string LabelFont:(UIFont *)font withLabelWidth:(CGFloat)width;
//获取16进制颜色
+ (UIColor *)getColor:(NSString *)colorstr;
//RM在前
+ (NSMutableAttributedString *)setRMString:(NSString *)str;
//RM在后
+ (NSMutableAttributedString *)setBehindRMString:(NSString *)str;
//获取当天日期
+ (NSString *)getNowDate;

//push本地通知
+(void)pushLocalNotification:(NSString *)str;

/**
 短信验证码倒计时 GCD
 
 @param timeout 定时时间
 @param handlerBlock 每隔时间回调, presentTime-> 0~timeout-1
 @param finish 定时结束回调
 */
+ (void)timerWithTimeout:(int)timeout handlerBlock:(HandlerBlock)handlerBlock finish:(FinishBolck)finish;
@end
