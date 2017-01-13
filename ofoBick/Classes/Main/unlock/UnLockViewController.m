//
//  UnLockViewController.m
//  ofoBick
//
//  Created by Jack on 17/1/12.
//  Copyright © 2017年 SUP M. All rights reserved.
//

#import "UnLockViewController.h"
#import "HardwareTool.h"

@interface UnLockViewController ()

@property (weak, nonatomic) IBOutlet UIView *mainView;

@property (weak, nonatomic) IBOutlet UIButton *unlockBtn;
@property (weak, nonatomic) IBOutlet UILabel *noteLab;

@property (weak, nonatomic) IBOutlet UITextField *numTF;

@end

@implementation UnLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.numTF setValue:[UIFont systemFontOfSize:25] forKey:@"_displayLabel.font"];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_numTF becomeFirstResponder];
    
}
#pragma mark - IBAction

- (IBAction)unLockBtnTap:(UIButton *)sender {
    
    
}

- (IBAction)Flashlight:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    [HardwareTool changeFlash];
}


- (IBAction)numLabChange:(UITextField *)sender {
    
    if (sender.text.length == 0) {
        
        _noteLab.text = @"输入车牌号，获取解锁码";
        
    } else if (sender.text.length < 4) {
        
        _noteLab.text = @"车牌号一般为4~7为的数字";
        _unlockBtn.backgroundColor = UIColorFromRGB(0xE6E6E6);
        _unlockBtn.enabled = NO;
        
    } else if (sender.text.length <= 8) {
        
        _noteLab.text = @"温馨提示：若输错车牌，将无法打开车锁";
        _unlockBtn.backgroundColor = UIColorFromRGB(0xFDCF0A);
        _unlockBtn.enabled = YES;
        
    } else {
        
        sender.text = [sender.text substringToIndex:8];
    }
    
}

@end
