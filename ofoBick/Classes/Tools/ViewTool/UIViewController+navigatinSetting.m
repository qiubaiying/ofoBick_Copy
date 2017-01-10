//
//  UIViewController+navigatinSetting.m
//  渐变导航栏
//
//  Created by archerLj on 16/4/20.
//  Copyright © 2016年 archerLj. All rights reserved.
//

#import "UIViewController+navigatinSetting.h"

@implementation UIViewController (navigatinSetting)
-(void)setNavigationBarBackGroundColor:(UIColor *)color {
    [[self navigationBarBackGroundView] setBackgroundColor:color];
}

-(void)setNavigationBarAlpha:(CGFloat)alpha {
    [[self navigationBarBackGroundView] setAlpha:alpha];
}

-(UIView *)navigationBarBackGroundView {
    for (UIView *subView in self.navigationController.navigationBar.subviews) {
        if ([[subView class] isSubclassOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
            return subView;
        }
    }
    return nil;
}
@end
