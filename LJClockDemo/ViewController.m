//
//  ViewController.m
//  LJClockDemo
//
//  Created by LiuFeifei on 16/5/16.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "ViewController.h"
#import "LJClockView.h"
#import "LJAnimationClockView.h"

@interface ViewController ()

@property (nonatomic, strong) LJClockView * clockView;
@property (nonatomic, strong) LJAnimationClockView * animationClockView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 200) / 2;
    self.clockView = [[LJClockView alloc] initWithFrame:CGRectMake(x, 40, 200, 200) imageName:@"clock"];
    [self.view addSubview:self.clockView];
    
    self.animationClockView = [[LJAnimationClockView alloc] initWithFrame:CGRectMake(x, 300, 200, 200) imageName:@"clock"];
    [self.view addSubview:self.animationClockView];
}

@end
