//
//  BFZYNAlertView.m
//  BFMX-Comment-App
//
//  Created by yaning Zhu on 16/5/21.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "BFZYNAlertView.h"

@implementation BFZYNAlertView

- (instancetype)initWithTest:(NSString *)test lift:(NSString *)lift right:(NSString *)right
{
    self = [super initWithFrame:CGRectMake(0, 0, BFScreenW, BFScreenH)];
    if (self) {
        self.testLabel.text = test;
        [self.liftButton setTitle:lift forState:UIControlStateNormal];
        [self.rightButton setTitle:right forState:UIControlStateNormal];
    }
    return self;
}
- (void)awakeFromNib
{
    self.frame = CGRectMake(0, 0, BFScreenW, BFScreenH);
    self.view.layer.masksToBounds = YES;
    self.view.layer.cornerRadius = 6.0;
}

- (void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}
-(void)dismiss{
    [self removeFromSuperview];
}
- (void)setLift:(NSString *)lift{
    [self.liftButton setTitle:lift forState:UIControlStateNormal];
}
- (void)setRight:(NSString *)right{
    [self.rightButton setTitle:right forState:UIControlStateNormal];
}
- (void)setTest:(NSString *)test{
    self.testLabel.text = test;
}
- (IBAction)liftAction:(id)sender {
    [self dismiss];
    if (self.delegate && [self.delegate respondsToSelector:@selector(liftAction)]) {
        [self.delegate liftAction];
    }
}

- (IBAction)rightAction:(id)sender {
    [self dismiss];
    if (self.delegate && [self.delegate respondsToSelector:@selector(rightAction)]) {
        [self.delegate rightAction];
    }
}
@end
