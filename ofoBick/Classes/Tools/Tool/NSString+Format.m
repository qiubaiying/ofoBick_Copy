//
//  NSString+Format.m
//  EDYD-Driver
//
//  Created by apple on 16/8/2.
//  Copyright © 2016年 wade. All rights reserved.
//

#import "NSString+Format.h"

@implementation NSString (Format)


/** 将 2011年11月1日 转换指定时间格式 2011-11-1 */
+ (NSString *)getTimeFormatWith:(NSString *)str{
    
    str = [str stringByReplacingOccurrencesOfString:@"年" withString:@"-"];
    str = [str stringByReplacingOccurrencesOfString:@"月" withString:@"-"];
    str = [str stringByReplacingOccurrencesOfString:@"日" withString:@""];
    
    return str;
}

/** 将 2011-11-01 转换指定时间格式 2011年11月1日 */
+ (NSString *)changeTimeFormatWith:(NSString *)str {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [formatter dateFromString:str];
    
    [formatter setDateFormat:@"yyyy年M月d日"];
    
    NSString *dateStr = [formatter stringFromDate:date];
    
    return dateStr;
    
}

+ (NSString *)dateIntoRemainingTime:(NSString *)dateStr {
    
    NSTimeInterval time = [self _getRemainingTimeOfSecond:dateStr];

    if (time <= 0) {
        return @"已超时";
    }
    
    int day = time / 86400;
    int H = (int)time % day / 3600;
    int m = (int)time % day / 60 % 60;
    
    if (day < 1) {
        NSLog(@"%@",[NSString stringWithFormat:@"剩余 %d小时%02d分", H, m]);
        return [NSString stringWithFormat:@"剩余 %d小时%02d分", H, m];
    } else {
        return [NSString stringWithFormat:@"剩余 %d天", day];
    }
    
    
}

+ (NSString *)getCustomDate:(NSString *)dateStr {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
     [dateFormatter setDateFormat:@"MM/dd HH:mm"];
    NSString *str = [dateFormatter stringFromDate:date];
    
    NSTimeInterval time = [self _getRemainingTimeOfSecond:dateStr];
    
    if (time < 3600 * 24 * 31) {
        
        NSDate *date = [[NSDate alloc] init];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd"];
        NSString *todayStr = [formatter  stringFromDate:date];
        int today = [todayStr intValue];
        
        NSString *dayStr = [dateStr substringWithRange:NSMakeRange(8, 2)];
        int day = [dayStr intValue];
        
        int dayDifference = day - today;
        
        // 今天
        if (dayDifference == 0) {
            return [NSString stringWithFormat:@"今天 %@",[str substringFromIndex:6]];
        } else {
            return str;
        }
        
        
    }
    
    return [dateStr substringFromIndex:5];

}

+ (NSString *)getHommizationDate:(NSString *)dateStr {
    
    NSTimeInterval time = [self _getRemainingTimeOfSecond:dateStr];

    if (time <= 0) {
        return @"已超时";
    }
    
    if (time < 3600 * 24 * 31) {
        
        NSDate *date = [[NSDate alloc] init];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd"];
        NSString *todayStr = [formatter  stringFromDate:date];
        int today = [todayStr intValue];
        
        NSString *dayStr = [dateStr substringWithRange:NSMakeRange(8, 2)];
        int day = [dayStr intValue];
        
        int dayDifference = day - today;
        
        // 今天
        if (dayDifference == 0) {
            return [NSString stringWithFormat:@"今天 %@",[dateStr substringFromIndex:11]];
        } else if (dayDifference == 1) {
            return [NSString stringWithFormat:@"明天 %@",[dateStr substringFromIndex:11]];
        } else if (dayDifference == 2) {
            return [NSString stringWithFormat:@"后天 %@",[dateStr substringFromIndex:11]];
        }
    }
    
    
    return [dateStr substringFromIndex:5];
    
}

+ (NSString *)getSimpleHommizationDate:(NSString *)dateStr {
    
    NSString *str = [self getHommizationDate:dateStr];
    if ([[str substringToIndex:2] isEqualToString:@"今天"]) {
        return @"今天";
    }
    return [dateStr substringToIndex:5];

}
/** 是否小于4小时 */
+ (BOOL)remainingTimeIsLessThanHoursWithDate:(NSString *)dateStr {
    
  NSTimeInterval time = [self _getRemainingTimeOfSecond:dateStr];
    
    // 时间小于12小时
    if (time <= 60 * 60 * 4) {
        return YES;
    }
    
    return NO;
    
}

/** 是否超时 */
+ (BOOL)isTimeOutWithDate:(NSString *)dateStr {
    
    NSTimeInterval time = [self _getRemainingTimeOfSecond:dateStr];
    
    if (time < 0) {
        
        return YES;
    }
    
    return NO;
    
    
    
}

+ (NSString *)getTimeNoYearWith:(NSString *)dateStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //参数字符串转化成时间格式
    NSDate * date = [formatter dateFromString:dateStr];
    [formatter setDateFormat:@"MM月dd日 HH:mm"];
    
    NSString *str = [formatter stringFromDate:date];
    
    if (str) {
        
        return str;
    }
    
    return @"时间输入格式错误";
}


/** 获取时间差 S */
+ (NSTimeInterval)_getRemainingTimeOfSecond:(NSString *)dateStr {
    
    //设置格式  年yyyy 月 MM 日dd 小时hh(HH) 分钟 mm 秒 ss MMM单月 eee周几 eeee星期几 a上午下午
    //与字符串保持一致
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //    //现在的时间转换成字符串
    //    NSDate * nowDate = [NSDate date];
    //    NSString * nowTime = [formatter stringFromDate:nowDate];
    
    //参数字符串转化成时间格式
    NSDate * date = [formatter dateFromString:dateStr];
    //参数时间距现在的时间差
    NSTimeInterval time = [date timeIntervalSinceNow];
    return time;

}

- (NSInteger)BYYear {
    return [[self _getComponents] year];
}

- (NSInteger)BYMonth {
    return [[self _getComponents] month];
    
}

- (NSInteger)BYDay{
    return [[self _getComponents] day];
}


/** 根据当前时间获取日历 */
- (NSDateComponents *)_getComponents{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date = [formatter dateFromString:self];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    return components;

}

@end
