//
//  ConnctTool.m
//  HL
//
//  Created by wade on 15/7/12.
//  Copyright (c) 2015年 Lab-Illusion. All rights reserved.
//

#import "ConnctTool.h"
#import <CommonCrypto/CommonHMAC.h>
#import <netdb.h>
#import <arpa/inet.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "Toolbase64.h"
#import <CommonCrypto/CommonDigest.h>
#import "OrderedDictionary.h"

@implementation ConnctTool
+ (BOOL) connectedToNetwork
{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    
    return (isReachable && !needsConnection) ? YES : NO;
}
+(NSString *)get1970time
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970] * 1000;
    long long int date = (long long int)time;
    //NSLog(@"%@",[NSString stringWithFormat:@"%lld", date]);
    
    return [NSString stringWithFormat:@"%lld", date];
}
+(BOOL)getVisitorID
{
    if([[Config Instance] getVisitorID])
    {
        NSLog(@"%@",[[Config Instance] getVisitorID]);
        return YES;
    }
    if(![Config Instance].privateUUID)
    {
        [[Config Instance] saveUUID];
    }
    
    NSString *strul = [NSString stringWithFormat:@"%@/visitor/create",APIURL];
    
    NSString *timestr = [self get1970time];
    
    NSString *signatureStr = [self hmacsha1:[NSString stringWithFormat:@"uri=/visitor/create&method=GET&timestamp=%@&requestId=%@",timestr,[Config Instance].privateUUID] key:IPHONESECRETKEY];
    
    
    
    NSURL *url = [NSURL URLWithString:strul];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:CLIENTID                            forHTTPHeaderField:@"client-Id"];
    [request addValue:@"application/json; encoding=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:signatureStr                        forHTTPHeaderField:@"Client-Signature"];
    [request addValue:IPHONESECRETKEY                     forHTTPHeaderField:@"secret-key"];
    [request addValue:timestr                             forHTTPHeaderField:@"Timestamp"];
    
    [request addValue:[Config Instance].privateUUID        forHTTPHeaderField:@"Request-Id"];
    
    
    [request setHTTPMethod:@"GET"];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    //第二，三个参数是指针的指针，所有要用取址符，这个方法是同步方法。同步操作没有完成，后面的代码不会执行。
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error == nil)
    {
        //接受到数据，表示工作正常
        NSError *dicerror = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&dicerror];
        NSLog(@"VisitorID = %@",json);
        [[Config Instance] saveVisitorID:[json objectForKey:@"id"]];
        return YES;
    }
    
    if(error != nil || response == nil)
    {
        return NO;
    }
    return NO;
    
    
    
}
+(BOOL)putLanguage:(NSString *)lan
{
    NSString *strul = [NSString stringWithFormat:@"%@/visitor/create",APIURL];
    
    NSString *timestr = [self get1970time];
    
    //NSString *signatureStr = [self hmacsha1:[NSString stringWithFormat:@"uri=/visitor/create&method=GET&timestamp=%@&requestId=%@",timestr,[Config Instance].privateUUID] key:IPHONESECRETKEY];
    
    NSURL *url = [NSURL URLWithString:strul];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:CLIENTID                            forHTTPHeaderField:@"client-Id"];
    [request addValue:@"application/json; encoding=utf-8" forHTTPHeaderField:@"Content-Type"];
   
    [request addValue:IPHONESECRETKEY                     forHTTPHeaderField:@"secret-key"];
    [request addValue:timestr                             forHTTPHeaderField:@"Timestamp"];
    
    [request addValue:[Config Instance].privateUUID        forHTTPHeaderField:@"Request-Id"];
    

    OrderedDictionary *parmeter = [OrderedDictionary dictionary];
    [parmeter setValue:lan forKey:@"language"];
    
    [request setHTTPMethod:@"PUT"];
    
    NSString *signatureStr  = [ConnctTool getsignatureStrwithurl:strul andtype:@"PUT" andtime:timestr andbody:parmeter andrequestId:[Config Instance].privateUUID andvisitorId:[[Config Instance] getVisitorID]];
    
    [request addValue:signatureStr                        forHTTPHeaderField:@"Client-Signature"];
    
    NSError *reqerror = nil;
    [request setHTTPBody: [NSJSONSerialization dataWithJSONObject:parmeter options:NSJSONWritingPrettyPrinted error:&reqerror]];

    
    NSURLResponse *response = nil;
    NSError *error = nil;
    //第二，三个参数是指针的指针，所有要用取址符，这个方法是同步方法。同步操作没有完成，后面的代码不会执行。
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error == nil)
    {
        //接受到数据，表示工作正常
        NSError *dicerror = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&dicerror];
        NSLog(@"language = %@",json);
        return YES;
    }
    
    if(error != nil || response == nil)
    {
        return NO;
    }
    return NO;

    

}
+(NSString *)getsignatureStrwithurl:(NSString *)url andtype:(NSString *)type andtime:(NSString *)timeLocal andbody:(id)body andrequestId:(NSString *)requestId andvisitorId:(NSString *)visitorId
{
    if(body)
    {
        if ([NSJSONSerialization isValidJSONObject:body])
        {
            NSData *d = [NSJSONSerialization dataWithJSONObject:body options:0 error:nil];
            NSString *result = [[NSString alloc] initWithData:d  encoding:NSUTF8StringEncoding];
            
            NSString *str = [self hmacsha1:[NSString stringWithFormat:@"uri=%@&method=%@&body=%@&timestamp=%@&requestId=%@&visitorId=%@",url,type,result,timeLocal,requestId,visitorId] key:IPHONESECRETKEY];
            return str;
        }
    }

    
    NSString *strs = [self hmacsha1:[NSString stringWithFormat:@"uri=%@&method=%@&timestamp=%@&requestId=%@&visitorId=%@",url,type,timeLocal,requestId,visitorId] key:IPHONESECRETKEY];
    return strs;
}

+ (NSString *)hmacsha1:(NSString *)text key:(NSString *)secret
{
    
    NSData *secretData = [secret dataUsingEncoding:NSUTF8StringEncoding];
    NSData *clearTextData = [text dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[20];
    CCHmac(kCCHmacAlgSHA1, [secretData bytes], [secretData length], [clearTextData bytes], [clearTextData length], result);
    char base64Result[32];
    size_t theResultLength = 32;
    Base64EncodeData(result, 20, base64Result, &theResultLength,YES);
    //base64_encode(result, 20, base64Result, &theResultLength);
    NSData *theData = [NSData dataWithBytes:base64Result length:theResultLength];
    NSString *base64EncodedResult = [[NSString alloc] initWithData:theData encoding:NSUTF8StringEncoding];
    return base64EncodedResult;
}
+ (void)saveCookies
{
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey: @"sessionCookies"];
    [defaults synchronize];
    
}



@end
