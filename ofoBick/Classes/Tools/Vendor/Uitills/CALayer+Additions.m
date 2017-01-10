//
//  CALayer+Additions.m
//  EDYD
//
//  Created by wade on 16/4/15.
//  Copyright © 2016年 wade. All rights reserved.
//

#import "CALayer+Additions.h"

@implementation CALayer (Additions)

- (UIColor *)borderColorFromUIColor {
    
    return objc_getAssociatedObject(self, @selector(borderColorFromUIColor));
}
-(void)setBorderColorFromUIColor:(UIColor *)color
{
    objc_setAssociatedObject(self, @selector(borderColorFromUIColor), color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setBorderColorFromUI:color];
}
- (void)setBorderColorFromUI:(UIColor *)color
{
    self.borderColor = color.CGColor;
    
}

@end
