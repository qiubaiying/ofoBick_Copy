//
//  BYDrawButton.h
//  ofoBick
//
//  Created by Jack on 17/1/13.
//  Copyright © 2017年 SUP M. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface BYDrawButton : UIButton

@property (nonatomic) IBInspectable UIColor *fillColor;           //填充颜色
@property (nonatomic) IBInspectable NSInteger lineWidth;          //线的宽度
@property (nonatomic) IBInspectable NSInteger cornerRadius;       //圆角弧度
@property (nonatomic) IBInspectable NSInteger borderWidth;        //边框宽度


@end
