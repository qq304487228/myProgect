//
//  BFSSResponseBase.m
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/2/20.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "BFSSResponseBase.h"

@implementation BFSSResponseBase
//@synthesize data = _data;

- (BOOL)isSuccess
{
    return (self.code == 200);
}
@end
