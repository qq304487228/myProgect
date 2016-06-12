//
//  UILabel+BFSS.h
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/2/3.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (BFSS)
/**
 *  计算label文字的高度
 *
 *  @param mytext     文字
 *  @param labelWidth label的宽
 *  @param font       字体
 *
 *  @return 高度
 */
+(CGFloat)heightWith:(NSString *)mytext labelWidth:(CGFloat)labelWidth labelFont:(UIFont *)font;
@end
