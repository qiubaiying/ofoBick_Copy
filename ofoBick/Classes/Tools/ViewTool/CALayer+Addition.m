//
//  CALayer+Addition.m
//  Property
//
//  Created by longking on 15/10/10.
//  Copyright © 2015年 longking. All rights reserved.
//

#import "CALayer+Addition.h"

@implementation CALayer (Addition)

-(void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}
-(UIColor*)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
