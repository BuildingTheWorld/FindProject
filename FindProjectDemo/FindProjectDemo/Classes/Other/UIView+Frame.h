//
//  UIView+Frame.h
//  QT
//
//  Created by qt on 16/4/25.
//  Copyright © 2016年 qt. All rights reserved.
//



// 避免冲突，加前缀

@interface UIView (Frame)

@property CGFloat qt_width;
@property CGFloat qt_height;
@property CGFloat qt_x;
@property CGFloat qt_y;

@property CGFloat qt_centerX;
@property CGFloat qt_centerY;

@end
