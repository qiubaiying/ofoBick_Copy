//
//  NetRequestClass.h
//  MVVMTest
//
//  Created by wade on 15/1/6.
//  Copyright (c) 2015年 wade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FowtechError.h"
#import "OrderedDictionary.h"

//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id fowTechError);
typedef void (^FailureBlock)();
typedef void (^NetWorkBlock)(BOOL netConnetState);



@interface NetRequestClass : NSObject

#pragma 监测网络的可链接性
+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl;

#pragma 普通外部GET请求
+ (void) NetRequestNormalGETWithRequestURL: (NSString *) requestURLString
                             WithParameter: (OrderedDictionary *) parameter
                      WithReturnValeuBlock: (ReturnValueBlock) block
                        WithErrorCodeBlock: (ErrorCodeBlock) errorBlock;

#pragma POST请求
+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                 WithReturnValeuBlock: (ReturnValueBlock) block
                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock;

#pragma GET请求
+ (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (ReturnValueBlock) block
                  WithErrorCodeBlock: (ErrorCodeBlock) errorBlock;

#pragma PUT请求
+ (void) NetRequestPUTWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (ReturnValueBlock) block
                  WithErrorCodeBlock: (ErrorCodeBlock) errorBlock;

#pragma DELETE请求
+ (void) NetRequestDELETEWithRequestURL: (NSString *) requestURLString
                          WithParameter: (NSDictionary *) parameter
                   WithReturnValeuBlock: (ReturnValueBlock) block
                     WithErrorCodeBlock: (ErrorCodeBlock) errorBlock;



+(FowtechError *)ErrorStringWithOp:(NSURLSessionTask *)operation andError:(NSError *)error;

@end
