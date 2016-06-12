//
//  BJZYNAutoPicTool.m
//  自动轮播图
//
//  Created by yaning Zhu on 16/6/12.
//  Copyright © 2016年 yaning Zhu. All rights reserved.
//

#import "BJZYNAutoPicTool.h"
@interface BJZYNAutoPicTool(){
    CGFloat  selfWidth;
    CGFloat  selfHeight;
}
@property (nonatomic,strong)UIScrollView * myScrollView;
@end
@implementation BJZYNAutoPicTool
//加载myScrollView
-(UIScrollView *)myScrollView{
    if (_myScrollView == nil) {
        _myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight)];
        _myScrollView.contentSize = CGSizeMake(_modelArray.count * selfWidth, selfHeight);
        _myScrollView.contentOffset = CGPointMake(0, 0);
        _myScrollView.pagingEnabled = YES;
        _myScrollView.bounces = NO;
        _myScrollView.showsHorizontalScrollIndicator = NO;
        _myScrollView.showsVerticalScrollIndicator = NO;

    }
    return _myScrollView;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        selfWidth = frame.size.width;
        selfHeight = frame.size.height;
    }
    return self;
}
-(void)setModelArray:(NSArray *)modelArray{
    _modelArray = modelArray;
    //移除scrollView
    _myScrollView =nil;
    [_myScrollView removeFromSuperview];
    for (int i = 0; i<modelArray.count; i++) {
        //这里以后换成model
        NSString * string = [modelArray objectAtIndex:i];
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * selfWidth, 0, selfWidth, selfHeight)];
        imageView.image = [UIImage imageNamed:string];
        [self.myScrollView addSubview:imageView];
    }
    [self addSubview:self.myScrollView];
}
@end
