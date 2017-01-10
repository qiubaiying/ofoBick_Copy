//
//  NavMainView.h
//  TTS-LITE
//
//  Created by Jack on 16/12/20.
//  Copyright © 2016年 wade. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BtnBlock)(void);

@interface NavMainView : UIView


#pragma mark ErrorStatus

@property (weak, nonatomic) IBOutlet UIImageView *iconEro;
@property (weak, nonatomic) IBOutlet UILabel *titlelabelEro;
@property (weak, nonatomic) IBOutlet UILabel *detailLabelEro;




#pragma mark Bolck
@property (strong, nonatomic) BtnBlock sureBlock;
@property (strong, nonatomic) BtnBlock cancelBlock;

@end


@interface NavSucView : UIView



@property (weak, nonatomic) IBOutlet UIImageView *iconSuc;
@property (weak, nonatomic) IBOutlet UILabel *titleLabelSuc;
@property (weak, nonatomic) IBOutlet UILabel *detailLabelSuc;

@property (strong, nonatomic) BtnBlock sureBlock;

@end

@interface NavAgaView : UIView

@property (assign, nonatomic) BOOL isSelected;

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconAga;
@property (weak, nonatomic) IBOutlet UILabel *titleLabelAga;
@property (weak, nonatomic) IBOutlet UILabel *detailLabelAga;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (strong, nonatomic) BtnBlock cancelBlock;
@property (strong, nonatomic) BtnBlock sureBtnBlock;



@end

