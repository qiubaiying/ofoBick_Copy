//
//  ViewModelClass.h
//  MVVMTest
//
//  Created by wade on 15/1/8.
//  Copyright (c) 2015年 wade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FowtechError.h"
#import "NetRequestClass.h"
@interface ViewModelClass : NSObject


typedef void (^CallBackReturnBlock)(id data); //定义一个block返回

@property (strong, nonatomic) CallBackReturnBlock callbackBlock;

@property (strong, nonatomic) ReturnValueBlock returnBlock;
@property (strong, nonatomic) ErrorCodeBlock errorBlock;
@property (strong, nonatomic) FailureBlock failureBlock;


//获取网络的链接状态
-(void) netWorkStateWithNetConnectBlock: (NetWorkBlock) netConnectBlock WithURlStr: (NSString *) strURl;

// 传入交互的Block块
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock;



////回调传值
//-(void)getCallbackBlock:(CallBackReturnBlock)returnblock;

@end
