//
//  BFZYNVideoTool.h
//  BFMX-Comment-App
//
//  Created by yaning Zhu on 16/5/22.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFZYNVideoTool : NSObject
+ (NSString *)getImage:(NSString *)videoURL;
+ (NSString *)encodeMP4URL:(NSURL *)urlStr;
+ (CGFloat) getVideoLength:(NSURL *)URL;
+ (CGFloat) getFileSize:(NSString *)path;
+ (NSString *)uuidString;
@end
