//
//  UINavigationController+FullScreenPopGestureRecognizer.m
//  ReactiveCocoa进阶
//
//  Created by Jack on 16/12/30.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "UINavigationController+FullScreenPopGestureRecognizer.h"

@implementation UINavigationController (FullScreenPopGestureRecognizer)

- (void)openFullScreenPopGestureRecognizer {

    // 打印系统手势，寻找需要的 delegate 及 action
    NSLog(@"%@",self.interactivePopGestureRecognizer);
    NSLog(@"%@",self.interactivePopGestureRecognizer.delegate);
    
    // 获取系统返回手势代理
    id target = self.interactivePopGestureRecognizer.delegate;
    
    // 创建滑动手势，添加 target 及 action
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    // 设置手势代理，拦截手势
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
    
    // 禁用系统手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

// 调用时机：每次触发手势前都会询问代理，是否触发
// 作用：拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    // 注意：根控制器没有返回功能
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    return YES;
    
}




@end
