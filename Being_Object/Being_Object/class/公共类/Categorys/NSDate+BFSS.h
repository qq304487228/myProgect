//
//  NSDate+BFSS.h
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/3/9.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BFSS)
/**
 *  将date 转成string 格式为 2016-03-09 17:00
 */
-(NSString *)bf_string;
/**
 *   2016-03-09
 */
-(NSString *)bf_yearMonthDay;
/**
 *  将时间转成时间戳
 */
-(double)bf_changeTimeInterval;
/**
 *  将时间戳 转成date 注意时区
 */
+(NSDate *)bf_changDateWith:(double)timeInterval;
/**
 *  将时间的的分钟至于00
 */
-(NSDate *)bf_deletMinute;

@end
