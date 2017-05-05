//
//  ViewController.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "ViewController.h"
#import "FindViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor magentaColor];
    
    
    UIColor *navColor = [UIColor colorWithHexValue:0xFBFAFA alpha:1];
    
    UIImage *navImage = [UIImage imageWithColor:navColor];
    
    [self.navigationController.navigationBar setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.title = @"青酱说";
    
    FindViewController *findVC = [[FindViewController alloc] init];
    
    [self.view addSubview:findVC.view];
    
    [findVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}


@end
