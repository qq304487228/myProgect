//
//  BJArticleScrollView.h
//  各部位健身
//
//  Created by yaning Zhu on 16/6/13.
//  Copyright © 2016年 yaning Zhu. All rights reserved.
//
#import <UIKit/UIKit.h>
@protocol BJArticleScrollViewDelegate <NSObject>

- (void)tapImageView:(NSInteger)i;

@end
@interface BJArticleScrollView : UIView
@property (nonatomic ,strong)NSArray * picArray;
@property (nonatomic ,assign)id<BJArticleScrollViewDelegate>delegate;
@end
