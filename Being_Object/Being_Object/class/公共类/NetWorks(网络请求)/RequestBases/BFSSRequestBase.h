//
//  BFSSRequestBase.h
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/2/20.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFSSRequestBase : NSObject
/**
 *  url头部
 */
@property(nonatomic,strong) NSString                *apiDomain;
/**
 *  需要拼接的url后面的部分
 */
@property(nonatomic,strong) NSString                *Lastname;
/**
 *  参数字典
 */
@property(nonatomic,strong) NSMutableDictionary     *paramDic;
/**
 *  拼接出完整的url
 */
- (NSString *)stringOfApiURLString;
/**
 *  将字典转成json字符串
 */
- (NSString *)getPostBody;


/**
 *  装着图片的数组
 */
@property(nonatomic,strong)NSMutableArray<NSData *> * imageDatas;
/**
 *  接受图片的参数
 */
@property (nonatomic,copy)NSString *fileName;
@end
