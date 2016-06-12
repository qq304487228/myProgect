//
//  UIBarButtonItem+BFSSItem.m
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/2/18.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "UIBarButtonItem+BFSSItem.h"

@implementation UIBarButtonItem (BFSSItem)
+(instancetype)itemWithBgImage:(NSString *)bgImage highlighted:(NSString *)highlightedBgImage Target:(id)target action:(SEL)action{
    UIButton *btn =[[UIButton alloc]init ];
    [btn setBackgroundImage:[UIImage imageNamed:bgImage] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:highlightedBgImage] forState:UIControlStateHighlighted];
    btn.size =btn.currentBackgroundImage.size;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
