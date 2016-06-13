//
//  BJArticleScrollView.m
//  各部位健身
//
//  Created by yaning Zhu on 16/6/13.
//  Copyright © 2016年 yaning Zhu. All rights reserved.
//

#import "BJArticleScrollView.h"
#define picHeight 40  //图片高度
#define picWidth 100 //图片宽度
#define picSpace 20  //图片间距
@interface BJArticleScrollView(){
    CGRect rect;
}
@property (nonatomic,strong)UIScrollView * myScrollView;
@end
@implementation BJArticleScrollView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        rect = frame;
    }
    return self;
}
-(UIScrollView *)myScrollView{
    if (_myScrollView != nil) {
        [_myScrollView removeFromSuperview];
    }
    _myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    _myScrollView.showsVerticalScrollIndicator = NO;
    _myScrollView.showsHorizontalScrollIndicator = NO;
    _myScrollView.contentSize = CGSizeMake(picWidth * _picArray.count + picSpace * (_picArray.count+1), rect.size.height);
    for (int i=0; i<_picArray.count; i++) {
        UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[_picArray objectAtIndex:i]]];
        imageView.frame = CGRectMake(picSpace * (i+1) + picWidth*i, 10, picWidth, picHeight);
        imageView.layer.masksToBounds = YES;
        imageView.tag = i+1;
        imageView.layer.cornerRadius = picHeight/6;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [imageView addGestureRecognizer:tap];
        [_myScrollView addSubview:imageView];
    }
    return _myScrollView;
}
- (void)tapAction:(UITapGestureRecognizer *)tap{
    UIImageView * imageView = (UIImageView * )tap.view;
    if (self.delegate && [self.delegate respondsToSelector:@selector(tapImageView:)]) {
        [self.delegate tapImageView:imageView.tag];
    }
}
-(void)setPicArray:(NSArray *)picArray{
    _picArray = picArray;
    [self addSubview:self.myScrollView];
}
@end
