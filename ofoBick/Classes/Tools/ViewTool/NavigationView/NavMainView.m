//
//  NavMainView.m
//  TTS-LITE
//
//  Created by Jack on 16/12/20.
//  Copyright © 2016年 wade. All rights reserved.
//

#import "NavMainView.h"

@implementation NavMainView

- (IBAction)surebtnTap:(id)sender {
    
    if (_sureBlock) {
        _sureBlock();
    }
}

- (IBAction)cancelBtnTap:(id)sender {
    
    if (_cancelBlock) {
        _cancelBlock();
    }
    
}

@end

@implementation NavSucView

- (IBAction)sureBtnTap:(id)sender {
    
    if (_sureBlock) {
        _sureBlock();
    }
    
}


@end




@implementation NavAgaView

- (IBAction)leftBtnTap:(id)sender {
    
    
    if (self.leftBtn.tag == 100) {// 取消
        
        if (self.isSelected == YES) {
            [self btnRestore];
        } else {
            [self btnCancel];
        }
        
        
        
    } else {// 确认卸货
    
        if (self.sureBtnBlock) {
            self.sureBtnBlock();
        }
    }
    
    
}

- (IBAction)rightBtnTap:(id)sender {
    
    if (self.isSelected == YES) {
        
        if (self.leftBtn.tag == 100) {
            
            if (self.cancelBlock) {
                self.cancelBlock();
            }
            
        } else {
            [self btnRestore];
        }
    } else {
        
        if (self.leftBtn.tag == 100) {
            
            [self btnSure];
        }
        
    }
 
}

// 恢复
- (void)btnRestore {
    
    self.leftBtn.tag = 100;
    
    [UIView transitionWithView:self.mainView duration:0.23 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
        self.titleLabel.text = @"卸货区域";
        
        [self.leftBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"我要卸货" forState:UIControlStateNormal];
        
        [self.leftBtn setTitleColor:UIColorText forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"button_popup_cancel"] forState:UIControlStateNormal];
        [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"button_popup_confirm"] forState:UIControlStateNormal];
        
        self.isSelected = NO;
        
    } completion:nil];
    
    
}

// 确认卸货
- (void)btnSure {
    
    self.leftBtn.tag = 101;
    
    [UIView transitionWithView:self.mainView duration:0.23 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
        self.titleLabel.text = @"再次确认";
        
        [self.leftBtn setTitle:@"确认要卸货" forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"返回" forState:UIControlStateNormal];
        
        [self.leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:UIColorText forState:UIControlStateNormal];
        
        [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"button_popup_again"] forState:UIControlStateNormal];
        [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"button_popup_cancel"] forState:UIControlStateNormal];

//        self.leftBtn.selected = YES;
//        self.rightBtn.selected = YES;
        
        self.isSelected = YES;
        
    } completion:nil];
    
    
}

// 确认取消
- (void)btnCancel {
    
    self.leftBtn.tag = 100;
    
    [UIView transitionWithView:self.mainView duration:0.23 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
        self.titleLabel.text = @"再次确认";

        [self.leftBtn setTitle:@"返回" forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"确认不卸货" forState:UIControlStateNormal];
        
        [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.leftBtn setTitleColor:UIColorText forState:UIControlStateNormal];
        
        [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"button_popup_cancel"] forState:UIControlStateNormal];
        [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"button_popup_again"] forState:UIControlStateNormal];
        
//        self.leftBtn.selected = YES;
//        self.rightBtn.selected = YES;
        
        self.isSelected = YES;
        
    } completion:nil];
    
}

@end
