//
//  BFSSCheckUtil.h
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/3/7.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFSSCheckUtil : NSObject
/**
 *  检查是否为有效的邮箱
 */
+ (BOOL)isValidateEmail:(NSString *)email;
/**
 *  检查是否为有效的手机号码
 */
+ (BOOL)isValidateMobile:(NSString *)mobile;
// 正则判断手机号码地址格式   使用这个 
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
/**
 *  检查是否为空字符串
 */
+ (BOOL)isStringEmpty:(NSString *)str;
/**
 *  检查是否为有效的密码格式
 */
+ (BOOL)checkPassword:(NSString *) password;
/**
 *  检查是否为有效的身份证号????
 */
+ (BOOL) validateCarNo:(NSString *)carNo;
/**
 *  去除字符串两段的空格
 */
+ (NSString *)trimStringEmpty:(NSString *)str;

+ (NSString *)trimStringNil:(NSString *)str;
/**
 * 去除全部的空格 */
+(NSString *)trimAllStringEmpty:(NSString *)str;
/************密码secry *************/
/**
 *  MD5 加密
 */
+ ( NSString *)md5String:( NSString *)str;
/**
 *  转化数字的显示格式
 *   大于1万的  显示 一位小数
 */
+ (NSString *)countChange:(NSString *)num;

@end
