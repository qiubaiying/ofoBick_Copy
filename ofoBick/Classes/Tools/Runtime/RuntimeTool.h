//
//  RuntimeTool.h
//  ofoBick
//
//  Created by Jack on 17/1/12.
//  Copyright © 2017年 BY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(RuntimeTool)

/** 打印类中的 属性 */
+ (void)printfClassProperties;
- (void)printfClassProperties;

/** 打印类中的 成员变量 */
+ (void)printfClassIvars;
- (void)printfClassIvars;

/** 打印类中的 方法 */
+ (void)printfClassMethods;
- (void)printfClassMethods;




@end
