//
//  NetRequestClass.m
//  MVVMTest
//
//  Created by wade on 15/1/6.
//  Copyright (c) 2015年 wade. All rights reserved.
//

#import "NetRequestClass.h"

#define kUserDefaultsCookie @"sessionCookies"

@interface NetRequestClass ()

@end


@implementation NetRequestClass
#pragma 监测网络的可链接性
+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl
{
    __block BOOL netState = NO;
    
    NSURL *baseURL = [NSURL URLWithString:strUrl];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                netState = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
    return netState;
}
/***************************************
 在这做判断如果有dic里有errorCode
 调用errorBlock(dic)
 没有errorCode则调用block(dic
 ******************************/
#pragma --mark 外部GET请求方式
+ (void) NetRequestNormalGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (OrderedDictionary *) parameter
                WithReturnValeuBlock: (ReturnValueBlock) block
                  WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
{
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager.requestSerializer setTimeoutInterval:30];
    
    [manager GET:requestURLString parameters:parameter
        progress:^(NSProgress * _Nonnull downloadProgress)
     {
         //NSLog(@"%lld", downloadProgress.totalUnitCount);
     }
         success:^(NSURLSessionDataTask *operation, id responseObject)
     {
    
         block(responseObject);
         
     }
     failure:^(NSURLSessionDataTask *operation, NSError *error)
     {
         errorBlock(error);
     }];
    
}

#pragma --mark GET请求方式
+ (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (OrderedDictionary *) parameter
                WithReturnValeuBlock: (ReturnValueBlock) block
                  WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
{
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:CLIENTID                            forHTTPHeaderField:@"client-Id"];
    [manager.requestSerializer setValue:@"application/json; encoding=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:IPHONESECRETKEY                     forHTTPHeaderField:@"secret-key"];
    [manager.requestSerializer setValue:[[Config Instance] getVisitorID]    forHTTPHeaderField:@"Visitor-Id"];
    [manager.requestSerializer setValue:[Config Instance].privateUUID         forHTTPHeaderField:@"Request-Id"];
    
    
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",APIURL,requestURLString];
    NSString *timestr = [ConnctTool get1970time];
    NSString *signatureStr  = [ConnctTool getsignatureStrwithurl:requestURLString andtype:@"GET" andtime:timestr andbody:parameter andrequestId:[Config Instance].privateUUID andvisitorId:[[Config Instance] getVisitorID]];
    [manager.requestSerializer setValue:signatureStr forHTTPHeaderField:@"Client-Signature"];
    [manager.requestSerializer setValue:timestr forHTTPHeaderField:@"Timestamp"];
   
    
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsCookie];
    if([cookiesdata length])
    {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        NSHTTPCookie *cookie;
        for (cookie in cookies)
        {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
            [manager.requestSerializer setValue:[NSString stringWithFormat:@"JSESSIONID=%@",cookie.value] forHTTPHeaderField:@"Cookie"];
        }
    }
    
    [manager.requestSerializer setTimeoutInterval:30];
    
    [manager GET:strUrl parameters:parameter
        progress:^(NSProgress * _Nonnull downloadProgress)
     {
         //NSLog(@"%lld", downloadProgress.totalUnitCount);
     }
         success:^(NSURLSessionDataTask *operation, id responseObject)
     {
         NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:APIURL]];
         NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
         [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserDefaultsCookie];
         block(responseObject);
         
     }
         failure:^(NSURLSessionDataTask *operation, NSError *error)
     {
         errorBlock([self ErrorStringWithOp:operation andError:error]);
     }];
    
}

#pragma --mark POST请求方式

+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (OrderedDictionary *) parameter
                 WithReturnValeuBlock: (ReturnValueBlock) block
                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
{

    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:CLIENTID                            forHTTPHeaderField:@"client-Id"];
    [manager.requestSerializer setValue:@"application/json; encoding=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:IPHONESECRETKEY                     forHTTPHeaderField:@"secret-key"];
    [manager.requestSerializer setValue:[[Config Instance] getVisitorID]    forHTTPHeaderField:@"Visitor-Id"];
    [manager.requestSerializer setValue:[Config Instance].privateUUID         forHTTPHeaderField:@"Request-Id"];
    
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",APIURL,requestURLString];
    NSString *timestr = [ConnctTool get1970time];
    NSString *signatureStr  = [ConnctTool getsignatureStrwithurl:requestURLString andtype:@"POST" andtime:timestr andbody:parameter andrequestId:[Config Instance].privateUUID andvisitorId:[[Config Instance] getVisitorID]];
    [manager.requestSerializer setValue:signatureStr forHTTPHeaderField:@"Client-Signature"];
    [manager.requestSerializer setValue:timestr forHTTPHeaderField:@"Timestamp"];
    
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsCookie];
    if([cookiesdata length])
    {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        NSHTTPCookie *cookie;
        for (cookie in cookies)
        {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
            [manager.requestSerializer setValue:[NSString stringWithFormat:@"JSESSIONID=%@",cookie.value] forHTTPHeaderField:@"Cookie"];
        }
    }
    
    [manager.requestSerializer setTimeoutInterval:30];
    
    [manager POST:strUrl parameters:parameter
         progress:^(NSProgress * _Nonnull downloadProgress)
     {
         //NSLog(@"%lld", downloadProgress.totalUnitCount);
     }
          success:^(NSURLSessionDataTask *operation, id responseObject)
     {
         NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:APIURL]];
         NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
         [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserDefaultsCookie];
         block(responseObject);
         
     }
          failure:^(NSURLSessionDataTask *operation, NSError *error)
     {
         errorBlock([self ErrorStringWithOp:operation andError:error]);
         
     }];
    
}

+ (void) NetRequestPUTWithRequestURL: (NSString *) requestURLString
                       WithParameter: (OrderedDictionary *) parameter
                WithReturnValeuBlock: (ReturnValueBlock) block
                  WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:CLIENTID                            forHTTPHeaderField:@"client-Id"];
    [manager.requestSerializer setValue:@"application/json; encoding=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:IPHONESECRETKEY                     forHTTPHeaderField:@"secret-key"];
    [manager.requestSerializer setValue:[[Config Instance] getVisitorID]    forHTTPHeaderField:@"Visitor-Id"];
    [manager.requestSerializer setValue:[Config Instance].privateUUID         forHTTPHeaderField:@"Request-Id"];
    
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",APIURL,requestURLString];
    NSString *timestr = [ConnctTool get1970time];
    NSString *signatureStr  = [ConnctTool getsignatureStrwithurl:requestURLString andtype:@"PUT" andtime:timestr andbody:parameter andrequestId:[Config Instance].privateUUID andvisitorId:[[Config Instance] getVisitorID]];
    [manager.requestSerializer setValue:signatureStr forHTTPHeaderField:@"Client-Signature"];
    [manager.requestSerializer setValue:timestr forHTTPHeaderField:@"Timestamp"];
    
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsCookie];
    if([cookiesdata length])
    {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        NSHTTPCookie *cookie;
        for (cookie in cookies)
        {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
            [manager.requestSerializer setValue:[NSString stringWithFormat:@"JSESSIONID=%@",cookie.value] forHTTPHeaderField:@"Cookie"];
        }
    }
    [manager.requestSerializer setTimeoutInterval:30];
    
    [manager PUT:strUrl parameters:parameter
         success:^(NSURLSessionDataTask *operation, id responseObject)
     {
         NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:APIURL]];
         NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
         [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserDefaultsCookie];
         block(responseObject);
         
     }
         failure:^(NSURLSessionDataTask *operation, NSError *error)
     {
         errorBlock([self ErrorStringWithOp:operation andError:error]);
     }];

}


+ (void) NetRequestDELETEWithRequestURL: (NSString *) requestURLString
                          WithParameter: (NSDictionary *) parameter
                   WithReturnValeuBlock: (ReturnValueBlock) block
                     WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:CLIENTID                            forHTTPHeaderField:@"client-Id"];
    [manager.requestSerializer setValue:@"application/json; encoding=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:IPHONESECRETKEY                     forHTTPHeaderField:@"secret-key"];
    [manager.requestSerializer setValue:[[Config Instance] getVisitorID]    forHTTPHeaderField:@"Visitor-Id"];
    [manager.requestSerializer setValue:[Config Instance].privateUUID         forHTTPHeaderField:@"Request-Id"];
    
    
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",APIURL,requestURLString];
    NSString *timestr = [ConnctTool get1970time];
    NSString *signatureStr  = [ConnctTool getsignatureStrwithurl:requestURLString andtype:@"DELETE" andtime:timestr andbody:parameter andrequestId:[Config Instance].privateUUID andvisitorId:[[Config Instance] getVisitorID]];
    [manager.requestSerializer setValue:signatureStr forHTTPHeaderField:@"Client-Signature"];
    [manager.requestSerializer setValue:timestr forHTTPHeaderField:@"Timestamp"];
    
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsCookie];
    if([cookiesdata length])
    {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        NSHTTPCookie *cookie;
        for (cookie in cookies)
        {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
            [manager.requestSerializer setValue:[NSString stringWithFormat:@"JSESSIONID=%@",cookie.value] forHTTPHeaderField:@"Cookie"];
        }
    }
    [manager.requestSerializer setTimeoutInterval:30];
    
    [manager DELETE:strUrl parameters:parameter
            success:^(NSURLSessionDataTask *operation, id responseObject)
     {
         NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:APIURL]];
         NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
         [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserDefaultsCookie];
         block(responseObject);
         
     }
            failure:^(NSURLSessionDataTask *operation, NSError *error)
     {
         errorBlock([self ErrorStringWithOp:operation andError:error]);
         
     }];
}

+(FowtechError *)ErrorStringWithOp:(NSURLSessionTask *)operation andError:(NSError *)error
{
    [MBProgressHUD hideHUD];
    
    
    NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *)operation.response;
    
    FowtechError *FTerror;
    switch (httpResp.statusCode) {
        case 400:
        {
            FTerror = [[BadRequest alloc] init];
            FTerror.ErrorCode = (int)httpResp.statusCode;
        }
            break;
        case 401:
        {
            FTerror = [[NoLogin alloc] init];
            FTerror.ErrorCode = (int)httpResp.statusCode;
        }
            break;
        case 403:
        {
            FTerror = [[BadRequest alloc] init];
            FTerror.ErrorCode = (int)httpResp.statusCode;
            [[Config Instance] saveVisitorID:nil];
            [ConnctTool getVisitorID];
        }
            break;
        case 404:
        {
            FTerror = [[NoData alloc] init];
            FTerror.ErrorCode = (int)httpResp.statusCode;
        }
            break;
        case 405:
        case 500:
        {
            FTerror = [[InternalError alloc] init];
            FTerror.ErrorCode = (int)httpResp.statusCode;
        }
            break;
        default:
        {
            if ([error.userInfo objectForKey:@"NSLocalizedDescription"])
            {
                FTerror = [[BadRequest alloc] init];
                FTerror.ErrorCode = 400;
                FTerror.ErrorMsg = [error.userInfo objectForKey:@"NSLocalizedDescription"];
                
                
                NSRange range = [[error.userInfo objectForKey:@"NSLocalizedDescription"] rangeOfString:@"The Internet connection appears to be offline"];//判断字符串是否包含
                //if (range.location ==NSNotFound)//不包含
                if (range.length >0)//包含
                {
                    FTerror.ErrorMsg = @"网络异常，请检查网络";
                }
                
                NSRange ranges = [[error.userInfo objectForKey:@"NSLocalizedDescription"] rangeOfString:@"A server with the specified hostname"];//判断字符串是否包含
                //if (range.location ==NSNotFound)//不包含
                if (ranges.length >0)//包含
                {
                    FTerror.ErrorMsg = @"网络异常，请检查网络";
                }
                
                NSRange tranges = [[error.userInfo objectForKey:@"NSLocalizedDescription"] rangeOfString:@"The network connection was lost"];//判断字符串是否包含
                //if (range.location ==NSNotFound)//不包含
                if (tranges.length >0)//包含
                {
                    FTerror.ErrorMsg = @"网络异常，请检查网络";
                }
                
                return FTerror;
            }
        }
            break;
    }
    
// 网络差时 error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] 为空导致JSON解析crash
    if (nil == error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey]) {
//        FTerror.ErrorField = @"网络异常，请检查网络";
        FTerror.ErrorMsg = @"网络异常，请检查网络";
        return FTerror;
    }
    
    NSError *jsonError = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] options:0 error:&jsonError];
    if (jsonError) {
        NSLog(@"jsonError:%@", jsonError);
    }
    NSLog(@"json:%@",json);
    
    if([[json objectForKey:@"fieldError"] objectForKey:@"message"])
    {
        FTerror.ErrorField = [[json objectForKey:@"fieldError"] objectForKey:@"field"];
        FTerror.ErrorMsg = [[json objectForKey:@"fieldError"] objectForKey:@"message"];
    }
    if([json objectForKey:@"message"])
    {
        FTerror.ErrorMsg = [json objectForKey:@"message"];
        
        if([[json objectForKey:@"errorCode"] isEqualToString:@"VisitorNotFound"])
        {
            [[Config Instance] saveVisitorID:nil];
            [ConnctTool getVisitorID];
        }
        
    }
    
    if (!FTerror.ErrorMsg.length) {
        FTerror.ErrorMsg = @"内部错误，请稍后再试！";
    }
    
    
    
    return FTerror;
    
}

@end
