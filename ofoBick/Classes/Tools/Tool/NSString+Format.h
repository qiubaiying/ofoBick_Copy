//
//  NSString+Format.h
//  EDYD-Driver
//
//  Created by apple on 16/8/2.
//  Copyright © 2016年 wade. All rights reserved.
//  时间格式化显示

#import <Foundation/Foundation.h>

@interface NSString (Format)

/** 今天 10:30 或 12/24 10:30 */
+ (NSString *)getCustomDate:(NSString *)dateStr;

/** 将 2011年11月1日 时间格式化为 2011-11-1 */
+ (NSString *)getTimeFormatWith:(NSString *) str;

/** 将 2011-11-1 转换指定时间格式 2011年11月1日 */
+ (NSString *)changeTimeFormatWith:(NSString *)str;

/**
 *  将预定时间转化为剩余时间 输入时间格式:yyyy-MM-dd HH:mm:ss
 *
 *  @return 剩余时间，大于一天显示： 剩余 X天，小于一天 显示： 剩余 XX小时XX分
 */
+ (NSString *)dateIntoRemainingTime:(NSString *)dateStr;

/**
 *  人性化时间
 *
 *  @param dateStr yyyy-dd-MM HH:mm
 *
 *  @return 今天/明天/后天/HH:mm or dd-MM HH:mm
 */
+ (NSString *)getHommizationDate:(NSString *)dateStr;

/**
 *  简单的人性化时间
 *
 *  @param dateStr yyyy-dd-MM HH:mm
 *
 *  @return 今天 or mm:dd
 */
+ (NSString *)getSimpleHommizationDate:(NSString *)dateStr;


/**
 *  判断剩余是否小于12小时
 *
 *  @param dateStr yyyy-MM-dd HH:mm
 *
 *  @return 是否小于12小时
 */

+ (BOOL)remainingTimeIsLessThanHoursWithDate:(NSString *)dateStr;

/**
 * 判断是否超时
 *
 *  @param dateStr yyyy-MM-dd HH:mm
 *
 *  @return 是否超时
 */
+ (BOOL)isTimeOutWithDate:(NSString *)dateStr;

/**
 *  将时间转化为： MM月dd日 HH：mm
 *
 *  @param Datestr yyyy-dd-MM HH:mm:ss
 *
 *  @return MM月dd日 HH:mm
 */
+ (NSString *)getTimeNoYearWith:(NSString *)dateStr;


/**
 *  通过 DateStr 获取当前年月日
 *
 *  DateStr : yyyy-MM-dd HH:mm:ss
 *
 *  @return 年 月 日
 */
- (NSInteger)BYYear;

- (NSInteger)BYMonth;

- (NSInteger)BYDay;

@end
