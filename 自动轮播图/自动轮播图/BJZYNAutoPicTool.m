//
//  BJZYNAutoPicTool.m
//  自动轮播图
//
//  Created by yaning Zhu on 16/6/12.
//  Copyright © 2016年 yaning Zhu. All rights reserved.
//

#import "BJZYNAutoPicTool.h"
#import "KYAnimatedPageControl.h"
@interface BJZYNAutoPicTool()<UIScrollViewDelegate>{
    CGFloat  selfWidth;
    CGFloat  selfHeight;
}
@property (nonatomic,strong)UIScrollView * myScrollView;
@property(nonatomic, strong) KYAnimatedPageControl *pageControl;
@end
@implementation BJZYNAutoPicTool
//加载myScrollView
-(UIScrollView *)myScrollView{
    if (_myScrollView == nil) {
        _myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight)];
        _myScrollView.contentSize = CGSizeMake(_modelArray.count * selfWidth, selfHeight);
        _myScrollView.delegate = self;
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
    //底部添加索引
    [self addPageController];
}
- (void)addPageController{
    UIView * backGroundView = [[UIView alloc]initWithFrame:CGRectMake(0, selfHeight - 20, selfWidth, 20)];
    backGroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    
    self.pageControl = [[KYAnimatedPageControl alloc]
                        initWithFrame:CGRectMake(0,0,_modelArray.count*10,20)];
    self.pageControl.backgroundColor = [UIColor clearColor];
    self.pageControl.pageCount = _modelArray.count;
    self.pageControl.unSelectedColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.pageControl.selectedColor = [UIColor whiteColor];
    self.pageControl.bindScrollView = self.myScrollView;
    self.pageControl.shouldShowProgressLine = NO;
    self.pageControl.indicatorStyle = IndicatorStyleGooeyCircle;
    self.pageControl.indicatorSize = 10;
    self.pageControl.swipeEnable = YES;
    [backGroundView addSubview:self.pageControl];
    [self addSubview:backGroundView];
    self.pageControl.didSelectIndexBlock = ^(NSInteger index) {
        NSLog(@"Did Selected index : %ld", (long)index);
    };
}
#pragma mark-- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Indicator动画
    [self.pageControl.indicator animateIndicatorWithScrollView:scrollView
                                                  andIndicator:self.pageControl];
    
    if (scrollView.dragging || scrollView.isDecelerating || scrollView.tracking) {
        //背景线条动画
        [self.pageControl.pageControlLine
         animateSelectedLineWithScrollView:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.indicator.lastContentOffset = scrollView.contentOffset.x;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [self.pageControl.indicator
     restoreAnimation:@(1.0 / self.pageControl.pageCount)];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    self.pageControl.indicator.lastContentOffset = scrollView.contentOffset.x;
}

@end
