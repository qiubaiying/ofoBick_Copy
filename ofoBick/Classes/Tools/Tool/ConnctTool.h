//
//  ConnctTool.h
//  HL
//
//  Created by wade on 15/7/12.
//  Copyright (c) 2015年 Lab-Illusion. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ConnctTool : NSObject



/**
 *  首次登陆获取visitorid
 *
 *  @return
 */
+(BOOL)getVisitorID;


+(BOOL)putLanguage:(NSString *)lan;


/**
 *  获取时间戳
 *
 *  @return 时间戳
 */
+(NSString *)get1970time;

//获取签名
+(NSString *)getsignatureStrwithurl:(NSString *)url andtype:(NSString *)type andtime:(NSString *)timeLocal andbody:(id)body andrequestId:(NSString *)requestId andvisitorId:(NSString *)visitorId;

//保存cook
+(void)saveCookies;



@end
