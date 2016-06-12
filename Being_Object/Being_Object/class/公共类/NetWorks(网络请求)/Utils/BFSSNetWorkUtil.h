//
//  BFSSNetWorkUtil.h
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/2/20.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFSSRequestBase.h"
#import "BFSSResponseBase.h"

/**
 *  这个工具类不处理SVProgress的事件拉 需要外面做好处理 慎重使用
 */

@interface BFSSNetWorkUtil : NSObject





/**
 *  请求Server Api 接口方法
 *
 *  @param request 自定义的Request请求
 *  @param success 请求成功,返回Response对象
 *  @param failure 请求失败
 */
+ (void)post:(BFSSRequestBase *)request
             success:(void (^)(BFSSResponseBase *responseObject))success
             failure:(void (^)(NSError *error))failure;

/**
 *  上传图片
 */
+ (void)postImage:(BFSSRequestBase *)request success:(void (^)(BFSSResponseBase *responseObject))success progress:(void (^)(NSProgress *progress))progress failure:(void (^)(NSError *error))failure;

@end
