//
//  UINavigationController+FullScreenPopGestureRecognizer.h
//  ReactiveCocoa进阶
//
//  Created by Jack on 16/12/30.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (FullScreenPopGestureRecognizer)<UIGestureRecognizerDelegate>

/** 开启全屏Pop手势 */
- (void)openFullScreenPopGestureRecognizer;

@end
