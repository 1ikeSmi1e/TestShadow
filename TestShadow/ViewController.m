//
//  ViewController.m
//  TestShadow
//
//  Created by 首控微金财富 on 2017/12/22.
//  Copyright © 2017年 PDZhou. All rights reserved.
//

#import "ViewController.h"
#import "ShadowCornerBtn.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    UIButton *btn = [ShadowCornerBtn buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"测试专用" forState:UIControlStateNormal];
    btn.frame = CGRectMake((screenW - 300)/2, 100, 300, 40);
    [self.view addSubview:btn];
}
@end
