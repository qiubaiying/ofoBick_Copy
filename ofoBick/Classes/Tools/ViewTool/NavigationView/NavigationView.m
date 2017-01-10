//
//  NavigationView.m
//  TTS-LITE
//
//  Created by Jack on 16/12/20.
//  Copyright © 2016年 wade. All rights reserved.
//

#import "NavigationView.h"
#import "NavMainView.h"

@interface NavigationView ()
{
    int ibool;//确认卸货2次确认
}



@property (assign, nonatomic)ShowBoxStatus showBoxStatusTemp;


@property (nonatomic, strong) BtnBlock btnBolckTemp;
@property (nonatomic, strong) CancelBlock cancelBolckTemp;

@end

@implementation NavigationView

+ (void)showNavigationWithTitle:(NSString *)title Detail:(NSString *)detail Image:(UIImage *)image BtnText:(NSString *)text Status:(ShowBoxStatus)status {
    [[[self alloc] init] showNavigationWithTitle:title Detail:detail Image:image btnText:text Status:status BtnBlock:nil];
}

+ (void)showNavigationWithTitle:(NSString *)title Detail:(NSString *)detail Image:(UIImage *)image BtnText:(NSString *)text Status:(ShowBoxStatus)status BtnBlock:(BtnBlock)btnBlock {
    [[[self alloc] init] showNavigationWithTitle:title Detail:detail Image:image btnText:text Status:status BtnBlock:btnBlock];

}

- (void)showNavigationWithTitle:(NSString *)title Detail:(NSString *)detail Image:(UIImage *)image btnText:(NSString *)text Status:(ShowBoxStatus)status BtnBlock:(BtnBlock)btnBlock {
    
    ibool = NO;
    
    
    UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
    self.frame = keyWindow.bounds;
    [keyWindow addSubview:self];
    
    // 点击空白退出
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeView)];
//    [self addGestureRecognizer:tap];
    
    // 透明度变化从0 -- 0.4:初始状态是隐藏的
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    NavMainView *mainView = nil;
    
    switch (status) {
        case ErrorStatus:
        {
            mainView = [[NSBundle mainBundle] loadNibNamed:@"NavMainView" owner:nil options:nil][0];
            
            mainView.frame = keyWindow.bounds;
            
            [self addSubview:mainView];
            
            mainView.iconEro.image = image;
            
            mainView.titlelabelEro.text = title;
            
            mainView.detailLabelEro.text = detail;
            
            mainView.sureBlock = ^(){
                
                if (btnBlock) {
                    btnBlock();
                }
                [self closeView];
            };
            
            mainView.cancelBlock = ^() {
                
                [self closeView];
            };
            
            
            

            
        }
            break;
        case SuccessStatus:
        {
            NavSucView *navSucView = [[NSBundle mainBundle] loadNibNamed:@"NavMainView" owner:nil options:nil][1];
            
            navSucView.frame = keyWindow.bounds;
            
            [self addSubview:navSucView];
            
            navSucView.iconSuc.image = image;
            
            navSucView.titleLabelSuc.text = title;
            
            navSucView.detailLabelSuc.text = detail;
            
            navSucView.sureBlock = ^() {
                
                if (btnBlock) {
                    btnBlock();
                }
                [self closeView];
            };
            
        }
            break;
        case AgainSureStatus:
        {
            NavAgaView *navAgaView = [[NSBundle mainBundle] loadNibNamed:@"NavMainView" owner:nil options:nil][2];
            
            navAgaView.frame = keyWindow.bounds;
            
            [self addSubview:navAgaView];
            
            navAgaView.iconAga.image = image;
            
            navAgaView.titleLabelAga.text = title;
            
            navAgaView.detailLabelAga.text = detail;
            
            navAgaView.sureBtnBlock = ^() {
                
                if (btnBlock) {
                    btnBlock();
                }
                
                [self closeView];
            };
            
            navAgaView.cancelBlock = ^() {
                
                [self closeView];
            };
        }
            break;
            
        default:
            break;
    }
    
    [self show];
    
}




- (void)sureBtnTap {
    
    if (self.btnBolckTemp) {
        self.btnBolckTemp();
    }
    
    [self closeView];
}

- (IBAction)cencelBtnTap:(id)sender {
    [self closeView];
}


- (void)show {
    
    [UIView animateWithDuration:0.22 animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    }];
}

- (void)closeView {
    
    [self removeFromSuperview];
    
}
@end
