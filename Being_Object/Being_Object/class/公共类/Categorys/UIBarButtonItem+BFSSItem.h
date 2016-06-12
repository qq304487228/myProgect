//
//  UIBarButtonItem+BFSSItem.h
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/2/18.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BFSSItem)
+(instancetype)itemWithBgImage:(NSString *)bgImage highlighted:(NSString *)highlightedBgImage Target:(id)target action:(SEL)action;
@end
