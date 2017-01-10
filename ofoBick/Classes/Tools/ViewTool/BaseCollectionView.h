//
//  BaseCollectionView.h
//  HL
//
//  Created by wade on 15/7/16.
//  Copyright (c) 2015年 Lab-Illusion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefreshAutoNormalFooter.h>
#import <MJRefresh/MJRefreshNormalHeader.h>
@interface BaseCollectionView : UICollectionViewController
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
@end
