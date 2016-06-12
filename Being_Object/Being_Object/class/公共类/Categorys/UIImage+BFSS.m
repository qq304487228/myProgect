//
//  UIImage+BFSS.m
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/1/26.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "UIImage+BFSS.h"

@implementation UIImage (BFSS)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    // create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+ (UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}
-(UIImage *)Original{
    
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
