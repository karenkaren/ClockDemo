//
//  LJClockView.m
//  LJClockDemo
//
//  Created by LiuFeifei on 16/5/16.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "LJClockView.h"

@interface LJClockView ()
{
    NSTimer * _timer;
}

@property (nonatomic, strong) CALayer * hourLayer;
@property (nonatomic, strong) CALayer * minuteLayer;
@property (nonatomic, strong) CALayer * secondLayer;

@end

@implementation LJClockView

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage * image = [UIImage imageNamed:imageName];
        self.layer.contents = (__bridge id _Nullable)(image.CGImage);
        
        // hour
        self.hourLayer = [self layerWithBackgroundColor:[UIColor blackColor] size:CGSizeMake(3, frame.size.height * 0.5 - 40)];
        
        // minute
        self.minuteLayer = [self layerWithBackgroundColor:[UIColor blackColor] size:CGSizeMake(3, frame.size.height * 0.5 - 20)];
        
        // second
        self.secondLayer = [self layerWithBackgroundColor:[UIColor redColor] size:CGSizeMake(1, frame.size.height * 0.5 - 20)];
        self.secondLayer.cornerRadius = 0;
        
        // 定时器
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
        [self updateUI];
        
    }
    return self;
}

- (void)updateUI
{
    NSCalendar * calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents * components = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    NSInteger hour = components.hour;
    NSInteger minute = components.minute;
    NSInteger second = components.second;
    
    CGFloat perHourMove = 1.0 / 12 * 2 * M_PI;
    CGFloat hourAngle = hour * perHourMove + minute * (perHourMove / 60);
    self.hourLayer.transform = CATransform3DMakeRotation(hourAngle, 0, 0, 1);
    
    CGFloat perMinuteMove = 1.0 / 60 * 2 * M_PI;
    CGFloat minuteAngle = minute * perMinuteMove + second * (perMinuteMove / 60);
    self.minuteLayer.transform = CATransform3DMakeRotation(minuteAngle, 0, 0, 1);
    
    CGFloat secondAngle = second * 2 * M_PI / 60;
    self.secondLayer.transform = CATransform3DMakeRotation(secondAngle, 0, 0, 1);
}

- (CALayer *)layerWithBackgroundColor:(UIColor *)backgroundColor
                            size:(CGSize)size
{
    CALayer * layer = [CALayer layer];
    layer.backgroundColor = backgroundColor.CGColor;
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    layer.bounds = CGRectMake(0, 0, size.width, size.height);
    layer.cornerRadius = 4;
    [self.layer addSublayer:layer];
    
    return layer;
}

@end
