//
//  BYDrawButton.m
//  ofoBick
//
//  Created by Jack on 17/1/13.
//  Copyright © 2017年 SUP M. All rights reserved.
//

#import "BYDrawButton.h"
#import <pop/POP.h>

@implementation BYDrawButton

- (void)drawRect:(CGRect)rect {
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGRect myFrame=self.bounds;
    CGContextSetLineWidth(context, _lineWidth);
    CGRectInset(myFrame, 5, 5);
    [_fillColor set];
    UIRectFrame(myFrame);
    
    self.layer.cornerRadius=_cornerRadius;
    self.layer.borderWidth=_borderWidth;
    self.layer.borderColor=_fillColor.CGColor;
    
    [self addTarget:self action:@selector(scaleToSmall)
   forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [self addTarget:self action:@selector(scaleAnimation)
   forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(scaleToDefault)
   forControlEvents:UIControlEventTouchDragExit];
    
}
- (void)scaleToSmall
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.95f, 0.95f)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSmallAnimation"];
}
- (void)scaleAnimation
{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(2.f, 2.f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 25.0f;
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
    
}
- (void)scaleToDefault
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleDefaultAnimation"];
}


@end
