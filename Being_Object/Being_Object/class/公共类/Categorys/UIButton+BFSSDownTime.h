//
//  UIButton+BFSSDownTime.h
//  ssb
//
//  Created by Shirley on 16/2/18.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//  倒计时的btn

#import <UIKit/UIKit.h>

@interface UIButton (BFSSDownTime)

/**
 *  倒计时按钮
 *
 *  @param timeLine 倒计时总时间
 *  @param title    还没倒计时的title
 *  @param subTitle 倒计时中的子名字，如时、分
 *  @param mColor   还没倒计时的颜色
 *  @param color    倒计时中的颜色
 */
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle normalColor:(UIColor *)mColor countColor:(UIColor *)color;
@end
