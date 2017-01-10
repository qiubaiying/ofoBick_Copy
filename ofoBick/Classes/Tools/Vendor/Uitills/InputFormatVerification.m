//
//  InputFormatVerification.m
//  Dutyfree
//
//  Created by sky on 15/8/19.
//  Copyright (c) 2015年 Fow Tech. All rights reserved.
//

#import "InputFormatVerification.h"

@implementation InputFormatVerification

/**
 *  验证邮箱
 *
 *  @param email 邮箱
 *
 *  @return 是否正确
 */
+ (BOOL)validateEmail:(NSString *)email{
    NSString *emailRegex = @"[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    
    return [emailTest evaluateWithObject:email];
}

/**
 *  验证手机号
 *
 *  @param phone 手机号
 *
 *  @return 是否正确
 */
+ (BOOL)validatePhone:(NSString *)phone{
    
//    NSString *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
//    // 中国移动 China Mobile
//    NSString *CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
//    // 中国联通 China Unicom
//    NSString *CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
//    // 中国电信 China Telecom
//    NSString *CT = @"^1((33|53|8[0-9])[0-9]|349)\\d{7}$";
//    NSPredicate *regextestMOBILE = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",MOBILE];
//    NSPredicate *regextestCM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM];
//    NSPredicate *regextestCU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU];
//    NSPredicate *regextestCT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CT];
//    if (([regextestMOBILE evaluateWithObject:phone]==YES)||([regextestCM evaluateWithObject:phone]==YES)||([regextestCT evaluateWithObject:phone]==YES)||([regextestCU evaluateWithObject:phone]==YES)) {
//        return YES;
//    }else{
//        return NO;
//    }
    
    NSString *phoneRegex = @"1[3-8][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}

/**
 *  验证密码
 *
 *  @param password 密码
 *
 *  @return 是否正确
 */
+ (BOOL)validatePassword:(NSString *)password{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9-~!@#$%^&*()_+=<>?:';/.,]{8,20}";
    //NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$){6,20}";
  
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:password];
}

/**
 *  验证简单密码
 *
 *  @param password 密码
 *
 *  @return 是否正确
 */
+ (BOOL)validateSimplePassword:(NSString *)password{
    

    
    NSString *pattern = @"^{6,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:password];
}

/**
 *  验证用户名
 *
 *  @param name 用户名
 *
 *  @return 是否正确
 */
+ (BOOL) validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNamePredicate evaluateWithObject:name];
}

/**
 *  验证真实姓名
 *
 *  @param name 真实姓名
 *
 *  @return 是否正确
 */
+ (BOOL)validateName:(NSString *)name
{
    NSString *userNameRegex = @"^[\u4E00-\u9FA5]{1,6}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNamePredicate evaluateWithObject:name];
    
}

/**
 *  验证身份证号码
 *
 *  @param idCard 身份证号码
 *
 *  @return 是否正确
 */
+ (BOOL)validateIdCard:(NSString *)idCard {
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

/**
 *  验证URL
 *
 *  @param urlStr URLStr
 *
 *  @return 是否正确
 */
+ (BOOL)validateURL: (NSString *) urlStr {
    //NSString *pattern = @"^[0-9A-Za-z]{1,50}";
    NSString *pattern = @"http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:urlStr];
    return isMatch;
}

/**
 *  验证柜号
 *
 *  @param ContainerNum 柜号
 *
 *  @return 是否正确
 */
+ (BOOL)validateContainerNum:(NSString *)ContainerNum {
    
    NSString *pattern = @"^[A-Za-z]{4}[0-9]{7}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:ContainerNum];
    return isMatch;

}
/**
 *  验证铅封号
 *
 *  @param sealNum 铅封号
 *
 *  @return 是否正确
 */
+ (BOOL)validateSealNum:(NSString *) sealNum {
    
    NSString *pattern = @"^[a-zA-Z0-9]{5,15}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:sealNum];
    return isMatch;

}

@end
