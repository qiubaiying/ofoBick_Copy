//
//  BaseTableViewController.h
//  HL
//
//  Created by wade on 15/7/16.
//  Copyright (c) 2015年 Lab-Illusion. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseTableViewController : UITableViewController

#pragma 初始化下拉刷新
-(void)setupHeaderViewtarget:(id)target action:(SEL)selector;
-(void)beginHeadRefreshing;
-(void)endHeadRefreshing;

#pragma 初始化上拉加载
-(void)setupFooterViewtarget:(id)target action:(SEL)selector;
-(void)beginFootRefreshing;
-(void)NoMoreDataendFootRefreshing;
-(void)endFootRefreshing;
-(void)resetNoMoreData;
-(void)setupForDismissKeyboard;



-(void)setgifHeadView:(id)target action:(SEL)selector;

@end
