//
//  InputFormatVerification.h
//  Dutyfree
//
//  Created by sky on 15/8/19.
//  Copyright (c) 2015年 Fow Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputFormatVerification : NSObject

/** 验证邮箱 */
+ (BOOL)validateEmail:(NSString *)email;

/** 验证手机号 */
+ (BOOL)validatePhone:(NSString *)phone;

/** 验证密码 */
+ (BOOL)validatePassword:(NSString *)password;

/** 验证简单密码 */
+ (BOOL)validateSimplePassword:(NSString *)password;


/** 验证用户名 */
+ (BOOL)validateUserName:(NSString *)name;

/** 验证真实姓名 6位以内中文 */
+ (BOOL)validateName:(NSString *)name;

/** 验证身份证 */
+ (BOOL)validateIdCard: (NSString *) idCard;

/** 验证URL */
+ (BOOL)validateURL: (NSString *) UrlStr;

/** 验证柜号 4英文+6数字+1校验码 */
+ (BOOL)validateContainerNum:(NSString *) ContainerNum;

/** 验证铅封号 5-15数字字母组合 */
+ (BOOL)validateSealNum:(NSString *) sealNum;
@end
