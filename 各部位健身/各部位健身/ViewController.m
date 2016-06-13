//
//  ViewController.m
//  各部位健身
//
//  Created by yaning Zhu on 16/6/13.
//  Copyright © 2016年 yaning Zhu. All rights reserved.
//

#import "ViewController.h"
#import "BJArticleScrollView.h"
@interface ViewController ()<BJArticleScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BJArticleScrollView * hah = [[BJArticleScrollView alloc]initWithFrame:CGRectMake(0,100, [UIScreen mainScreen].bounds.size.width, 60)];
    hah.picArray = @[@"J63MI042Z4P8.jpg",@"J63MI042Z4P8.jpg",@"J63MI042Z4P8.jpg",@"J63MI042Z4P8.jpg",@"J63MI042Z4P8.jpg",@"J63MI042Z4P8.jpg",@"J63MI042Z4P8.jpg"];
    hah.delegate = self;
    [self.view addSubview:hah];
}
- (void)tapImageView:(NSInteger)i{
    NSLog(@"%d",i);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
