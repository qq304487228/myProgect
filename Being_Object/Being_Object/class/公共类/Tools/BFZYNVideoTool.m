//
//  BFZYNVideoTool.m
//  BFMX-Comment-App
//
//  Created by yaning Zhu on 16/5/22.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "BFZYNVideoTool.h"
#import <AVFoundation/AVFoundation.h>
#import "UIImage+BFSS.h"
@implementation BFZYNVideoTool
//获取视频中的某一阵
+ (NSString *)getImage:(NSString *)videoURL

{
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL fileURLWithPath:videoURL] options:nil];
    
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    gen.appliesPreferredTrackTransform = YES;
    
    CMTime time = CMTimeMakeWithSeconds(2.0, 5.0);
    
    NSError *error = nil;
    
    CMTime actualTime;
    
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    
    UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
    
    CGImageRelease(image);
    thumb=[UIImage OriginImage:thumb scaleToSize:CGSizeMake(300, 300)];
    NSData *imageData = UIImageJPEGRepresentation(thumb, 0.1);
    
    NSString *fileName = [NSString stringWithFormat:@"%.00f.jpg",[NSDate timeIntervalSinceReferenceDate]];
    
    NSString * tempFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
    [imageData writeToFile:tempFilePath atomically:YES];
    return tempFilePath;
    
}
#pragma  mark --视屏转码成mp4格式
+ (NSString *)encodeMP4URL:(NSURL *)urlStr{
    
    AVURLAsset *avSet = [AVURLAsset URLAssetWithURL:urlStr options:nil];
    NSArray *arr = [AVAssetExportSession exportPresetsCompatibleWithAsset:avSet];
    NSString * _mp4Path;
    if ([arr containsObject:AVAssetExportPresetMediumQuality]) {
        AVAssetExportSession *session = [AVAssetExportSession exportSessionWithAsset:avSet presetName:AVAssetExportPresetMediumQuality];
        _mp4Path = [NSTemporaryDirectory() stringByAppendingFormat:@"%.00f.mp4",[NSDate timeIntervalSinceReferenceDate]];
        session.outputURL = [NSURL fileURLWithPath:_mp4Path];
        session.shouldOptimizeForNetworkUse = YES;
        //转码格式设定 MP4
        session.outputFileType = AVFileTypeMPEG4;
        [session exportAsynchronouslyWithCompletionHandler:^{
            
            if ([session status] == AVAssetExportSessionStatusCompleted) {
                //获取视频缩略图
            }
        }];
    }
    return _mp4Path;
}
/**
 *  返回视频大小
 *
 *  @param path path
 *
 *  @return 大小size
 */
+ (CGFloat) getFileSize:(NSString *)path
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    CGFloat filesize = -1.0;
    if ([fileManager fileExistsAtPath:path]) {
        NSDictionary *fileDic = [fileManager attributesOfItemAtPath:path error:nil];//获取文件的属性
        filesize = [[fileDic objectForKey:NSFileSize] floatValue];
    }
    return filesize;
}
/**
 *  返回视频的时间
 *
 *  @param URL url
 *
 *  @return 返回秒数
 */
+ (CGFloat) getVideoLength:(NSURL *)URL
{
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                     forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:URL options:opts];
    float second = 0;
    second = urlAsset.duration.value/urlAsset.duration.timescale;
    return second;
}
//生成uuid
+ (NSString *)uuidString
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    return [uuid lowercaseString];
}
@end
