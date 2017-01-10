//
//  UIView+Line.m
//  Dutyfreestore
//
//  Created by wade on 15/12/7.
//  Copyright © 2015年 Fow Tech. All rights reserved.
//

#import "UIView+Line.h"

@implementation UIView (Line)



-(void)addBottomLine
{
    CALayer *xian = [CALayer layer];
    [xian setBackgroundColor:UIColorFromRGB(0xcbcbcb).CGColor];
    //[xian setDk_backgroundColorPicker:DKColorPickerWithKey(@"LINE")];
    xian.frame = CGRectMake(0, self.height - 0.5, SCREEN_WIDTH, 0.5);
    [self.layer addSublayer:xian];
}
-(void)addTopLine
{
    CALayer *xian = [CALayer layer];
    [xian setBackgroundColor:UIColorFromRGB(0xcbcbcb).CGColor];
    //[xian setDk_backgroundColorPicker:DKColorPickerWithKey(@"LINE")];
    xian.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0.5);
    [self.layer addSublayer:xian];
}
-(void)addMiddleLine:(CGRect)setFrame
{
    CALayer *xian = [CALayer layer];
    [xian setBackgroundColor:UIColorFromRGB(0xcbcbcb).CGColor];
    //[xian setDk_backgroundColorPicker:DKColorPickerWithKey(@"LINE")];
    xian.frame = setFrame;
    [self.layer addSublayer:xian];
}

- (void)addMiddleLineWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)width {
    [self addMiddleLine:CGRectMake(x, y, width, 0.5)];
}

- (void)addLineInBottomLayer:(CGRect)setFrame {
    CALayer *xian = [CALayer layer];
    [xian setBackgroundColor:UIColorFromRGB(0xcbcbcb).CGColor];
    //[xian setDk_backgroundColorPicker:DKColorPickerWithKey(@"LINE")];
    xian.frame = setFrame;
    [self.layer insertSublayer:xian atIndex:0];
}
@end
