//
//  FowtechError.h
//  SCOM
//
//  Created by wade on 15/8/31.
//  Copyright (c) 2015年 Fow Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FowtechError : UIViewController

@property (nonatomic,copy) NSString *ErrorMsg;
@property (nonatomic,assign) int ErrorCode;
@property (nonatomic,copy) NSString *ErrorField;

-(void)makeType:(UIViewController *)myview;

@end


@interface NoLogin : FowtechError

-(void)makeType:(UIViewController *)myview;

@end

@interface NoData : FowtechError

-(void)makeType:(UIViewController *)myview;

@end

@interface InternalError : FowtechError

-(void)makeType:(UIViewController *)myview;

@end

@interface BadRequest : FowtechError

-(void)makeType:(UIViewController *)myview;

@end