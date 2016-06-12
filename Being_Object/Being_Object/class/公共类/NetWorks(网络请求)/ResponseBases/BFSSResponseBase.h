//
//  BFSSResponseBase.h
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/2/20.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFSSResponseBase : NSObject

/**
 *  code 200 请求成功
 */
@property(nonatomic,assign) int            code;
@property(nonatomic,strong) NSString            *msg;
/**
 *  data必须在子类中重写 并且按照返回的数据的类型来定义
 */
//@property(nonatomic,strong) id                  data;

- (BOOL)isSuccess;
@end
