//
//  NSDate+BFSS.m
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/3/9.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "NSDate+BFSS.h"

@implementation NSDate (BFSS)
-(NSString *)bf_string{
    //转化成string
    NSDateFormatter *outputFormatter= [[NSDateFormatter alloc] init];
    
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [outputFormatter stringFromDate:self];
    
}
-(NSString *)bf_yearMonthDay{
    NSDateFormatter *outputFormatter= [[NSDateFormatter alloc] init];
    
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy-MM-dd"];
    return [outputFormatter stringFromDate:self];
}
-(double)bf_changeTimeInterval{
    return [self timeIntervalSince1970]*1000;
}

+(NSDate *)bf_changDateWith:(double)timeInterval{
    return [NSDate dateWithTimeIntervalSince1970:timeInterval/1000];
}

-(NSDate *)bf_deletMinute{
    long long time=[[NSDate date] timeIntervalSince1970];
    long long min =time/60;
    int  yushu =min%60;
    NSDate *today =[NSDate dateWithTimeIntervalSince1970:(time-yushu*60)];
    return today;
}
@end
