//
//  UIColor+Hex.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexValue:(long)hexValue alpha:(float)alpha
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hexValue & 0x00FF00) >> 8)) / 255.0
                            blue:((float)(hexValue & 0x0000FF)) / 255.0
                           alpha:alpha];
}

@end
