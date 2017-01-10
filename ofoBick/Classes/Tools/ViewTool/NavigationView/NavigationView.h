//
//  NavigationView.h
//  TTS-LITE
//
//  Created by Jack on 16/12/20.
//  Copyright © 2016年 wade. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CancelBlock)(void);

typedef void(^BtnBlock)(void);

@interface NavigationView : UIView

typedef NS_ENUM(NSUInteger, ShowBoxStatus) {
    
    ErrorStatus = 0,          // 有选择的   1.取消  2确认
    SuccessStatus,             // 知晓的     1.知道了
    AgainSureStatus             //需要2次确认的
    
};



/**
 展示通知信息
 
 @param title  标题
 @param detail 内容
 @param image  图片
 @param text   按钮文字
 */
+ (void)showNavigationWithTitle:(NSString *)title
                         Detail:(NSString *)detail
                          Image:(UIImage *)image
                        BtnText:(NSString *)text
                         Status:(ShowBoxStatus)status;
/**
 展示通知信息,带有确认Block
 
 @param title    标题
 @param detail   内容
 @param image    图片
 @param text     按钮文字
 @param btnBlock 点击按键Block
 */
+ (void)showNavigationWithTitle:(NSString *)title
                         Detail:(NSString *)detail
                          Image:(UIImage *)image
                        BtnText:(NSString *)text
                         Status:(ShowBoxStatus)status
                       BtnBlock:(BtnBlock) btnBlock;



@end
