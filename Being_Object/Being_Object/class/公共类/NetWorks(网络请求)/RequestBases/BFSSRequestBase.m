//
//  BFSSRequestBase.m
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/2/20.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "BFSSRequestBase.h"

@implementation BFSSRequestBase
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.paramDic = [[NSMutableDictionary alloc] init];
        self.apiDomain = ServiceAddress;
        self.imageDatas = [NSMutableArray array];
//#warning test
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if (value) {
        [self.paramDic setObject:value forKey:key];
    }
}

- (NSString *)stringOfApiURLString
{
    return [NSString stringWithFormat:@"%@/%@",self.apiDomain,self.Lastname];
}

- (NSString *)getPostBody
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self.paramDic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

@end
