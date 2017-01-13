//
//  PasswordViewController.m
//  ofoBick
//
//  Created by Jack on 17/1/13.
//  Copyright © 2017年 SUP M. All rights reserved.
//

#import "PasswordViewController.h"
#import "HardwareTool.h"

@interface PasswordViewController ()

@end

@implementation PasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Flashlight:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    [HardwareTool changeFlash];
}

- (IBAction)howUnlockBtnTap:(id)sender {
    
    NSLog(@"转动转盘，开锁🔐");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
