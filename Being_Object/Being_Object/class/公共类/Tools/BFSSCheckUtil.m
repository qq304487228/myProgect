//
//  BFSSCheckUtil.m
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/3/7.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "BFSSCheckUtil.h"
#import <CommonCrypto/CommonHMAC.h>
@implementation BFSSCheckUtil

+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:email];
}

+ (BOOL)isValidateMobile:(NSString *)mobile
{
    NSString *regex = @"^((13[0-9])|(14[5,7])|(15[^4,\\D])|(18[0,0-9])|(17[0,5-8]))\\d{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:mobile];
}
// 正则判断手机号码地址格式
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    
    NSString *huomen =@"^9999999999\\d{1}$";
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString * CV = @"^1[345678]\\d{9}$";
    NSPredicate *regextesthoumen =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", huomen];
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestcv = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CV];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestcv evaluateWithObject:mobileNum] == YES)||([regextesthoumen evaluateWithObject:mobileNum] == YES))
        {
        return YES;
        }
    else
        {
        return NO;
        }
}



+ (BOOL)checkPassword:(NSString *) password
{
//    NSString *mystring = @"Letter1234";
    NSString *regex = @"^[A-Za-z0-9]{6,}$";//[0-9]{6,18}|[a-zA-Z]{6,18}|[0-9A-Za-z]{6,18}
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [predicate evaluateWithObject:password];
    // 正则匹配用户密码6-18位数字和字母组合
//    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
//    BOOL isMatch = [pred evaluateWithObject:password];
//    return isMatch;
    
}
+ (BOOL) validateCarNo:(NSString *)carNo
{
    //    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    //    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    //    MyLog(@"carTest is %@",carTest);
    //    MyLog(@"%@",carNo);
    //    return [carTest evaluateWithObject:carNo];
    
    
    //  NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z0-9]{5}+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    //    MyLog(@"carTest is %@",carTest);
    //    MyLog(@"%@",carNo);
    return [carTest evaluateWithObject:carNo];
    //  return YES;
}
+ (BOOL)isStringEmpty:(NSString *)str
{
    if (str && str.length > 0) {
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        return (str.length <= 0);
    }
    return YES;
}

+ (NSString *)trimStringEmpty:(NSString *)str
{
    if (str && str.length > 0) {
        //去掉空格
        return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return @"";
}
+ (NSString *)trimStringNil:(NSString *)str
{
    if (str && str.length > 0) {
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (str.length > 0) {
            return str;
        }
    }
    return nil;
}
+(NSString *)trimAllStringEmpty:(NSString *)str{
    
    if (str && str.length > 0) {
       return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return @"";
    
}

+ ( NSString *)md5String:( NSString *)str

{
    
    const char *myPasswd = [str UTF8String ];
    
    unsigned char mdc[ 16 ];
    
    CC_MD5 (myPasswd, ( CC_LONG ) strlen (myPasswd), mdc);
    
    NSMutableString *md5String = [ NSMutableString string ];
    
    for ( int i = 0 ; i< 16 ; i++) {
        
        [md5String appendFormat : @"%02x" ,mdc[i]];
        
    }
    
    return md5String;
    
}
+ (NSString *)countChange:(NSString *)num{
    
    long long total =[num longLongValue];
    
    if (total>10000) {
        num =[NSString stringWithFormat:@"%.1f万",total*1.0/10000.0];
    }
    
    return num;
}
@end
