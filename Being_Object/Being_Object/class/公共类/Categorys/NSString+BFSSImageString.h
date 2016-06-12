//
//  NSString+BFSSImageString.h
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/3/16.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BFSSImageString)

/**
 *  获取wide 宽度的图片 高度等比缩放
 *
 *  @param wide 想要的宽
 */
-(NSString *)bf_stringImageUrlWideScale:(int)wide;
/**
 *  获取图片按照规定的宽高但是会被剪切
 */
-(NSString *)bf_stringImageUrlWide:(int)wide height:(int)height;
/**
 *  是否是Emoji表情
 */
+ (BOOL)isContainsEmoji:(NSString *)string;
@end
