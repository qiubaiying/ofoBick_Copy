//
//  Config.m
//  HL
//
//  Created by wade on 15/7/12.
//  Copyright (c) 2015年 Lab-Illusion. All rights reserved.
//

#import "Config.h"
#import "UICKeyChainStore/UICKeyChainStore.h"
#import "YYModel.h"

#define  KCFBundleName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]



@implementation Config



-(void)saveVisitorID:(NSString *)vid
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings removeObjectForKey:@"vid"];
    [settings setObject:vid forKey:@"vid"];
    [settings synchronize];
}
-(NSString *)getVisitorID
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"vid"];
}
-(BOOL)getIfLogin
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [[settings objectForKey:@"IfLogin"] boolValue];
}
-(void)saveIfLogin:(BOOL)value
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    if(value)
    {
        [settings setObject:@"1" forKey:@"IfLogin"];
    }
    else
    {
        [settings setObject:@"0" forKey:@"IfLogin"];
    }
    [settings synchronize];
}

//保存是否push token
-(void)saveIfPushToken:(BOOL)value
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    if(value)
    {
        [settings setObject:@"1" forKey:@"PushToken"];
    }
    else
    {
        [settings setObject:@"0" forKey:@"PushToken"];
    }
    [settings synchronize];
}
//获取是否push token
-(BOOL)getIfPushToken
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [[settings objectForKey:@"PushToken"] boolValue];
}

//保存发送验证码的时间，一分钟之内不允许在发送
-(void)saveSendCodeTime:(NSString *)str
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings removeObjectForKey:@"SendCodeTime"];
    [settings setObject:str forKey:@"SendCodeTime"];
    [settings synchronize];
}
//获取发送验证码的时间
-(NSString *)getSendCodeTime;
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"SendCodeTime"];
}

-(void)saveUserInfo:(NSMutableDictionary *)dic
{
    
    //MYLog(@"保存的个人数据：%@",dic);
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings removeObjectForKey:@"UserInfo"];
    [settings setObject:dic forKey:@"UserInfo"];
    [settings synchronize];
    
    NSNotification *notification = [NSNotification notificationWithName:@"ExpressNotification" object:nil userInfo:nil];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

-(NSDictionary *)getUserInfo
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"UserInfo"];
}
-(void)saveiOSDeviceToken:(NSString *)str
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:str forKey:@"iOSDeviceToken"];
    [settings synchronize];
}
-(NSString *)getiOSDeviceToken
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"iOSDeviceToken"];
}
//保存微信unionId
-(void)saveUnionId:(NSString *)uid
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:uid forKey:@"UnionId"];
    [settings synchronize];
}
//获取微信unionId
-(NSString *)getUnionId
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"UnionId"];
}

- (NSString *)privateUUID {
    if (_privateUUID == nil)
    {
        UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:@"com.edyd.driver.appstore"];
        _privateUUID = keychain[@"UUID"];
    }
    return _privateUUID;
}
-(NSString *)getUUID
{
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:@"com.edyd.driver.appstore"];
    NSString *UUID = keychain[@"UUID"];
    return UUID;
}

-(void)saveUUID
{
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:@"com.edyd.driver.appstore"];
    
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    
    NSString *strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
    
    keychain[@"UUID"] = strUUID;
}

//保存是否开始记录鹰眼轨迹
-(void)saveTraceRun:(BOOL)value
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    if(value)
    {
        [settings setObject:@"1" forKey:@"IfTraceRun"];
    }
    else
    {
        [settings setObject:@"0" forKey:@"IfTraceRun"];
    }
    [settings synchronize];
}
//获取是否开始记录
-(BOOL)getTraceRun
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [[settings objectForKey:@"IfTraceRun"] boolValue];
}

//保存搜索历史记录
-(void)saveHistoryArray:(NSMutableArray *)array
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:array forKey:@"HistoryArray"];
    [settings synchronize];
}

//保存通道运单id
-(void)savePushUnloadID:(NSString *)uid
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:uid forKey:@"PushUnloadID"];
    [settings synchronize];
}
//获取通道运单id
-(NSString *)getUPushUnloadID
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"PushUnloadID"];
}

//清空搜索历史记录
-(void)cleanHistoryArray
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings removeObjectForKey:@"HistoryArray"];
    [settings synchronize];
}

//获取搜索历史记录
- (NSArray *)getHistoryArray
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    NSArray *historyArray = [settings objectForKey:@"HistoryArray"];
    return historyArray;
}


//保存当天日期
- (void)saveToDay:(NSString *)date
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:date forKey:@"ToDay"];
    [settings synchronize];
}
//获取当天日期
-(NSString *)getToDay
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"ToDay"];
}

//保存push内容
-(void)savePushUserInfo:(NSDictionary *)UserInfo
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:UserInfo forKey:@"PushUserInfo"];
    [settings synchronize];
}
//获取push内容
-(NSDictionary *)getPushUserInfo
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"PushUserInfo"];
}



static Config * instance = nil;
+(Config *) Instance
{
    @synchronized(self)
    {
        if(nil == instance)
        {
            [self new];
        }
    }
    return instance;
}
+(id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if(instance == nil)
        {
            instance = [super allocWithZone:zone];
            return instance;
        }
    }
    return nil;
}
@end


@implementation PersonInfo

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"personid" : @"id",};
}


static PersonInfo *Pinstance = nil;
+(PersonInfo *) Instance
{
    @synchronized(self)
    {
        if(nil == Pinstance)
        {
            [self new];
        }
    }
    
    if([[Config Instance] getIfLogin])
    {
        NSDictionary *dic = [[Config Instance] getUserInfo];
        
        
//        Pinstance.licenseStatus = [[dic objectForKey:@"licenseStatus"] intValue];
//        Pinstance.name = [dic objectForKey:@"name"];
//        Pinstance.phone = [dic objectForKey:@"phone"];
//        Pinstance.headImgUrl = [dic objectForKey:@"headImgUrl"];
        
        [Pinstance yy_modelSetWithDictionary:dic];
        Pinstance.personid = [[dic objectForKey:@"id"] intValue];
    }
    
    return Pinstance;
}
+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if(Pinstance == nil)
        {
            Pinstance = [super allocWithZone:zone];
            return Pinstance;
        }
    }
    return nil;
}


@end
