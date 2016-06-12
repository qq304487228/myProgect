//
//  ViewController.m
//  自动轮播图
//
//  Created by yaning Zhu on 16/6/12.
//  Copyright © 2016年 yaning Zhu. All rights reserved.
//

#import "ViewController.h"
#import "BJZYNAutoPicTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BJZYNAutoPicTool * pic = [[BJZYNAutoPicTool alloc]initWithFrame:CGRectMake(0, 0, 300, 150)];
    pic.modelArray = @[@"J63MI042Z4P8.jpg",@"J63MI042Z4P8.jpg",@"J63MI042Z4P8.jpg"];
    [self.view addSubview:pic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
