//
//  UIView+Frame.m
//  QT
//
//  Created by qt on 16/4/25.
//  Copyright © 2016年 qt. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)qt_height
{
    return self.frame.size.height;
}

- (void)setQt_height:(CGFloat)qt_height
{
    CGRect frame = self.frame;
    
    frame.size.height = qt_height;
    
    self.frame = frame;
}

- (CGFloat)qt_width
{
    return self.frame.size.width;
}

- (void)setQt_width:(CGFloat)qt_width
{
    CGRect frame = self.frame;
    
    frame.size.width = qt_width;
    
    self.frame = frame;
}

- (CGFloat)qt_x
{
    return self.frame.origin.x;
}

- (void)setQt_x:(CGFloat)qt_x
{
    CGRect frame = self.frame;
    
    frame.origin.x = qt_x;
    
    self.frame = frame;
}

- (CGFloat)qt_y
{
     return self.frame.origin.y;
}

- (void)setQt_y:(CGFloat)qt_y
{
    CGRect frame = self.frame;
    
    frame.origin.y = qt_y;
    
    self.frame = frame;
}

- (void)setQt_centerX:(CGFloat)qt_centerX
{
    CGPoint center = self.center;
    
    center.x = qt_centerX;
    
    self.center = center;
}

- (CGFloat)qt_centerX
{
    return self.center.x;
}

- (void)setQt_centerY:(CGFloat)qt_centerY
{
    CGPoint center = self.center;
    
    center.y = qt_centerY;
    
    self.center = center;
}

- (CGFloat)qt_centerY
{
    return self.center.y;
}

@end
