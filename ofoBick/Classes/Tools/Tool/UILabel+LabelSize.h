//
//  UILabel+LabelSize.h
//  TTS-LITE
//
//  Created by Jack on 16/12/7.
//  Copyright © 2016年 wade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelSize)

/**
 获取动态Label高度 (size、font默认)

 @param text Label文本
 @return 高度
 */
+ (CGFloat)getLabelHightWithText:(NSString *)text;

@end
