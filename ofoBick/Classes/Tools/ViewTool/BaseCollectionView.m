//
//  BaseCollectionView.m
//  HL
//
//  Created by wade on 15/7/16.
//  Copyright (c) 2015年 Lab-Illusion. All rights reserved.
//

#import "BaseCollectionView.h"

@interface BaseCollectionView ()

@end

@implementation BaseCollectionView


- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}

#pragma 初始化下拉刷新
- (void)setupHeaderViewtarget:(id)target action:(SEL)selector
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:selector];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.font = [UIFont systemFontOfSize:13];
    self.collectionView.mj_header = header;
}
-(void)beginHeadRefreshing
{
    [self.collectionView.mj_header beginRefreshing];
}
-(void)endHeadRefreshing
{
    [self.collectionView.mj_header endRefreshing];
}
#pragma 初始化上拉加载
-(void)setupFooterViewtarget:(id)target action:(SEL)selector
{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:selector];
    footer.stateLabel.font = [UIFont systemFontOfSize:13];
    self.collectionView.mj_footer = footer;
}
-(void)beginFootRefreshing
{
    [self.collectionView.mj_footer beginRefreshing];
}
-(void)NoMoreDataendFootRefreshing
{
    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
}
-(void)endFootRefreshing
{
    [self.collectionView.mj_footer endRefreshing];
}
-(void)resetNoMoreData
{
    [self.collectionView.mj_footer resetNoMoreData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupForDismissKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    
    __weak UIViewController *weakSelf = self;
    
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [weakSelf.view addGestureRecognizer:singleTapGR];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [weakSelf.view removeGestureRecognizer:singleTapGR];
                }];
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}

@end
