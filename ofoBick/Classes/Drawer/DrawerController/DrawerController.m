//
//  DrawerController.m
//  EDYD-Driver
//
//  Created by apple on 16/8/5.
//  Copyright © 2016年 wade. All rights reserved.
//

#import "DrawerController.h"


@interface DrawerController ()

@end

@implementation DrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIStoryboard *rerosonalSb = [UIStoryboard storyboardWithName:@"Drawer" bundle:nil];
    
    self.leftDrawerViewController = [rerosonalSb instantiateViewControllerWithIdentifier:@"DrawerViewController"];
    
    UIStoryboard *homeSb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UINavigationController *homeNC = [homeSb instantiateViewControllerWithIdentifier:@"MainNC"];
    
    
    // 将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    
    
    self.centerViewController = homeNC;
    
    // 侧边栏宽度
    [self setMaximumLeftDrawerWidth:self.view.frame.size.width * 0.68];
    
    [self setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    
    [self setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    // 中心控制器不能交互
    [self setCenterHiddenInteractionMode:MMDrawerOpenCenterInteractionModeNone];
    
    [self setShowsShadow:NO];// 关阴影
    [self setShouldStretchDrawer:NO];// 关闭回弹
    
    
    // [self setDrawerVisualStateBlock:[MMDrawerVisualState parallaxVisualStateBlockWithParallaxFactor:2]];
    // 设置动画
//    [self setDrawerVisualStateBlock:[MMDrawerVisualState swingingDoorVisualStateBlock]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)openDrawerSide:(MMDrawerSide)drawerSide animated:(BOOL)animated velocity:(CGFloat)velocity animationOptions:(UIViewAnimationOptions)options completion:(void (^)(BOOL))completion {
//    [super openDrawerSide:drawerSide animated:animated velocity:velocity animationOptions:options completion:completion];
//    NSLog(@"openDrawerSide");
//}

@end
