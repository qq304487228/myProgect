//
//  UILabel+BFSS.m
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/2/3.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "UILabel+BFSS.h"

@implementation UILabel (BFSS)
+(CGFloat)heightWith:(NSString *)mytext labelWidth:(CGFloat)labelWidth labelFont:(UIFont *)font{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize size = [mytext boundingRectWithSize:CGSizeMake(labelWidth, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return size.height;
}

@end
