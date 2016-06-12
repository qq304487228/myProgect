//
//  BFZYNGetTypeForImage.m
//  BFMX-Comment-App
//
//  Created by yaning Zhu on 16/5/21.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "BFZYNGetTypeForImage.h"

@implementation BFZYNGetTypeForImage
+ (NSString *)typeForImageData:(NSData *)data {
    
    
    uint8_t c;
    
    [data getBytes:&c length:1];
    
    
    
    switch (c) {
            
        case 0xFF:
            
            return @"jpeg";
            
        case 0x89:
            
            return @"png";
            
        case 0x47:
            
            return @"gif";
            
        case 0x49:
            
        case 0x4D:
            
            return @"tiff";
            
    }
    
    return nil;
    
}
// 此方法随机产生32位字符串

+(NSString *)ret32bitString

{
    
    char data[32];
    
    for (int x=0;x<32;data[x++] = (char)('A' + (arc4random_uniform(26))));
    
    return [[NSString alloc] initWithBytes:data length:32 encoding:NSUTF8StringEncoding];
    
}
@end
