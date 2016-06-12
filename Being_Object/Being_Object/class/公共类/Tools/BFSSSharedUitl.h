//
//  BFSSSharedUitl.h
//  友盟分享
//
//  Created by Shirley on 16/3/23.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BFSSSharedUitl : NSObject
+ (instancetype)sharedUitl;

/**
 *  分享
 *
 *  @param vc         当前控制器
 *  @param title      标题
 *  @param shareText  内容
 *  @param shareImage 图片
 *  @param dataUrl    url
 */
- (void)SharedContentContriller:(UIViewController *)vc title:(NSString *)title shareText:(NSString *)shareText shareImage:(UIImage *)shareImage dataUrl:(NSString *)dataUrl;
@end
