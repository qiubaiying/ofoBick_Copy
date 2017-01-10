//
//  Tool.m
//  HL
//
//  Created by wade on 15/7/16.
//  Copyright (c) 2015年 Lab-Illusion. All rights reserved.
//

#import "Tool.h"

static int _timeout;

@interface Tool ()

@property (nonatomic, strong) HandlerBlock handlerBlock;

@property (nonatomic, strong) FinishBolck finish;

@end

@implementation Tool


+(void)ActionError:(NSError *)error
{
    
    NSString *errorMsg;
    
    if ([[error domain] isEqualToString:NSURLErrorDomain])
    {
        switch ([error code]) {
            case NSURLErrorCannotFindHost:
                errorMsg = NSLocalizedString(@"Cannot find specified host. Retype URL.", nil);
                break;
            case NSURLErrorCannotConnectToHost:
                errorMsg = NSLocalizedString(@"Cannot connect to specified host. Server may be down.", nil);
                break;
            case NSURLErrorNotConnectedToInternet:
                errorMsg = NSLocalizedString(@"Cannot connect to the internet. Service may not be available..", nil);
                break;
            case 500:
                errorMsg = @"server_500";
                break;
            default:
                errorMsg = [error localizedDescription];
                break;
        }
    }
    else
    {
        errorMsg = [error localizedDescription];
    }
    
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:
                       NSLocalizedString(@"Error Loading Page", nil)
                                                 message:errorMsg delegate:self
                                       cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [av show];
}

+ (CGFloat)heightWithString:(NSString *)string LabelFont:(UIFont *)font withLabelWidth:(CGFloat)width {
    CGFloat height = 0;
    
    if (string.length == 0) {
        height = 0;
    } else {
        
        // 字体
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]};
        if (font) {
            attribute = @{NSFontAttributeName: font};
        }
        
        // 尺寸
        CGSize retSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                              options:
                          NSStringDrawingTruncatesLastVisibleLine |
                          NSStringDrawingUsesLineFragmentOrigin |
                          NSStringDrawingUsesFontLeading
                                           attributes:attribute
                                              context:nil].size;
        
        height = retSize.height;
    }
    
    return height;
}

+ (UIColor *)getColor:(NSString *)colorstr
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[colorstr substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[colorstr substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[colorstr substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
    
}

+ (NSMutableAttributedString *)setRMString:(NSString *)str
{
    NSMutableAttributedString *thestr = [[NSMutableAttributedString alloc] initWithString:str];
    
    //[thestr addAttribute:NSForegroundColorAttributeName value:GrayCOLOR range:NSMakeRange(0,2)];
    [thestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0,2)];
    
    return thestr;
    
}
+ (NSMutableAttributedString *)setBehindRMString:(NSString *)str
{
    NSMutableAttributedString *thestr = [[NSMutableAttributedString alloc] initWithString:str];
    
    //[thestr addAttribute:NSForegroundColorAttributeName value:GrayCOLOR range:NSMakeRange(str.length - 4,4)];
    [thestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(str.length - 4,4)];
    
    return thestr;
}

//获取当天日期
+ (NSString *)getNowDate
{
    NSDate *senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    NSString *locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}

+(void)pushLocalNotification:(NSString *)str
{
    // 1.创建通知
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    // 2.设置通知的必选参数
    // 设置通知显示的内容
    localNotification.alertBody = str;
    localNotification.soundName = @"win.aac";
    // 设置通知的发送时间
    //localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    
    // 3.发送通知
    // 方式一: 根据通知的发送时间(fireDate)发送通知
    //[[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    // 方式二: 立即发送通知
    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];

}


+ (void)timerWithTimeout:(int)timeout handlerBlock:(HandlerBlock)handlerBlock finish:(FinishBolck)finish {
    [[[self alloc] init] createTimerWithTimeout:timeout handlerBlock:handlerBlock finish:finish];
}


- (void)createTimerWithTimeout:(int)timeout handlerBlock:(HandlerBlock)handlerBlock finish:(FinishBolck)finish {
    
    _timeout = timeout;
    self.handlerBlock = handlerBlock;
    self.finish = finish;
    
    [self _startCountdown];
    
    
}


- (void)_startCountdown {
    
    int interval = 1;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), interval * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(timer, ^{
        
        if (_timeout <= 0) {
            
            NSLog(@"倒计时结束");
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (_finish) {
                    _finish();
                }
            });
            
            dispatch_source_cancel(timer);
            
        } else {
            
            //NSLog(@"%d", _timeout);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (_handlerBlock) {
                    _handlerBlock(_timeout);
                }
                _timeout --;
            });
            
            
        }
        
    });
    
    // 开启定时器
    dispatch_resume(timer);
    
    
}

@end
