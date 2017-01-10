//
//  Config.h
//  HL
//
//  Created by wade on 15/7/12.
//  Copyright (c) 2015年 Lab-Illusion. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PersonInfo;
@interface Config : NSObject

@property (nonatomic, strong) NSString *privateUUID;

//保存visitorid
-(void)saveVisitorID:(NSString *)vid;
//获取visitorid
-(NSString *)getVisitorID;

//保存用户信息
-(void)saveUserInfo:(NSMutableDictionary *)dic;
//获取用户信息
-(NSDictionary *)getUserInfo;

//保存是否push token
-(void)saveIfPushToken:(BOOL)value;
//获取是否push token
-(BOOL)getIfPushToken;


//保存是否登陆
-(void)saveIfLogin:(BOOL)value;
//获取是否登录
-(BOOL)getIfLogin;

//保存发送验证码的时间，一分钟之内不允许在发送
-(void)saveSendCodeTime:(NSString *)str;
//获取发送验证码的时间
-(NSString *)getSendCodeTime;

//保存设备id
-(void)saveiOSDeviceToken:(NSString *)str;
//获取设备id
-(NSString *)getiOSDeviceToken;

//保存是否开始记录鹰眼轨迹
-(void)saveTraceRun:(BOOL)value;
//获取是否开始记录
-(BOOL)getTraceRun;

//保存微信unionId
-(void)saveUnionId:(NSString *)uid;
//获取微信unionId
-(NSString *)getUnionId;

//保存通道运单id
-(void)savePushUnloadID:(NSString *)uid;
//获取通道运单id
-(NSString *)getUPushUnloadID;

//保存搜索历史记录
-(void)saveHistoryArray:(NSMutableArray *)array;
//清空搜索历史记录
-(void)cleanHistoryArray;
//获取搜索历史记录
-(NSMutableArray *)getHistoryArray;

//保存当天日期
-(void)saveToDay:(NSString *)date;
//获取当天日期
-(NSString *)getToDay;

//保存push内容
-(void)savePushUserInfo:(NSDictionary *)UserInfo;
//获取push内容
-(NSDictionary *)getPushUserInfo;

- (NSString *)getUUID;
- (void)saveUUID;


+(Config *) Instance;
+(id)allocWithZone:(NSZone *)zone;

@end



@interface PersonInfo : NSObject

@property (nonatomic, assign) int personid;

/** 电话 */
@property (nonatomic, copy) NSString *phone;

/** 认证状态 */
@property (nonatomic, assign) int status;

/** 真实姓名 */
@property (nonatomic, copy) NSString *name;

/** 认证状态 */
@property (nonatomic, assign) int type;

/** Token */
@property (nonatomic, copy) NSString *androidDeviceToken;


+(PersonInfo *) Instance;
//+(id)allocWithZone:(NSZone *)zone;

@end
