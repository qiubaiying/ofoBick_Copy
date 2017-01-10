//
//  UILabel+LabelSize.m
//  TTS-LITE
//
//  Created by Jack on 16/12/7.
//  Copyright © 2016年 wade. All rights reserved.
//

#import "UILabel+LabelSize.h"

@implementation UILabel (LabelSize)

/** 获取label高度 */
+ (CGFloat)getLabelHightWithText:(NSString *)text {
    
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width - 32, CGFLOAT_MAX);
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
    // NSString class method: boundingRectWithSize:options:attributes:context is
    // available only on ios7.0 sdk.
    CGRect rect = [text boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attributes
                                     context:nil];
    return rect.size.height;
}

@end
