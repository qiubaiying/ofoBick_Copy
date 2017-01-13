//
//  HardwareTool.m
//  ofoBick
//
//  Created by Jack on 17/1/13.
//  Copyright © 2017年 SUP M. All rights reserved.
//

#import "HardwareTool.h"
#import <AVFoundation/AVFoundation.h>

@interface HardwareTool ()


@end

@implementation HardwareTool

+ (void)changeFlash {
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //必须判定是否有闪光灯，否则如果没有闪光灯会崩溃
    if (![device hasFlash]) return;
    
    //修改前必须先锁定
    [device lockForConfiguration:nil];
    
    if (device.flashMode == AVCaptureFlashModeOff) {
        
        device.flashMode = AVCaptureFlashModeOn;
        device.torchMode = AVCaptureTorchModeOn;
        
    } else if (device.flashMode == AVCaptureFlashModeOn) {
        
        device.flashMode = AVCaptureFlashModeOff;
        device.torchMode = AVCaptureTorchModeOff;
    }
    
    [device unlockForConfiguration];
}

+ (void)closeFlash {

    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    if (![device hasFlash]) return;
    
    if (device.flashMode == AVCaptureFlashModeOn) {
        
        device.flashMode = AVCaptureFlashModeOff;
        device.torchMode = AVCaptureTorchModeOff;
    }
}


@end
