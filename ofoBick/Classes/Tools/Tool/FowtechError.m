//
//  FowtechError.m
//  SCOM
//
//  Created by wade on 15/8/31.
//  Copyright (c) 2015年 Fow Tech. All rights reserved.
//

#import "FowtechError.h"
@implementation FowtechError

-(void)makeType:(UIViewController *)myview
{
    NSLog(@"FowtechError  111111");
}

@end


@implementation NoLogin

-(void)makeType:(UIViewController *)myview
{
    [[Config Instance] saveIfLogin:NO];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    app.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
    
    
}

@end


@implementation NoData

/** 404 */
-(void)makeType:(UIViewController *)myview
{
    NSLog(@"noData, %@", [NSString stringWithFormat:@"errorClass:%@",[myview class]]);
    
     [MBProgressHUD showError:self.ErrorMsg];
    
}

@end


@implementation InternalError

/** 500 */
-(void)makeType:(UIViewController *)myview
{
    NSLog(@"internal error, %@", [NSString stringWithFormat:@"errorClass:%@",[myview class]]);
    
    [MBProgressHUD showError:self.ErrorMsg];

}

@end

@implementation BadRequest


/**  */
-(void)makeType:(UIViewController *)myview
{
    NSLog(@"bad request, %@", [NSString stringWithFormat:@"errorClass:%@",[myview class]]);
    
    [MBProgressHUD showError:self.ErrorMsg];
    
}

@end
