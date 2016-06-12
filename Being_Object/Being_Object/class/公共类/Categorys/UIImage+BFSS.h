//
//  UIImage+BFSS.h
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/1/26.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BFSS)
/**
 *  根据颜色生成一个1*1的Image
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  改变image的大小
 *  @param targetSize 改变后的size
 */
+ (UIImage*)OriginImage:(UIImage *)image scaleToSize:(CGSize)size;
/**
 *  保持图片不被渲染成蓝色
 *
 *  @return 原来的图片的颜色
 */
- (UIImage*)Original;
@end
