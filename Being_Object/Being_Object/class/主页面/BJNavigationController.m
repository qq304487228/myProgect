//
//  BJNavigationController.m
//  Being_Object
//
//  Created by yaning Zhu on 16/5/31.
//  Copyright © 2016年 yaning Zhu. All rights reserved.
//

#import "BJNavigationController.h"

@interface BJNavigationController ()

@end

@implementation BJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image =[UIImage imageWithColor:mainColor];
    [self.navigationBar setBackgroundImage:image                                                 forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
    
    //设置字体
    [self.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor colorFromHexRGB:@"666666"]}];

}
/**
 *  能拦截所有push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //2
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    if (self.viewControllers.count > 0) {
        // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
        [SVProgressHUD dismiss];
        // 设置导航栏按钮
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
        button.frame =CGRectMake(button.frame.origin.x, button.frame.origin.y, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
        
        // 监听按钮点击
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
    }
    [super pushViewController:viewController animated:animated];
    //2
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    //    NSLog(@"%@",self.navigationBar.subviews);
    //更改导航栏颜色
    UIImage *image =[UIImage imageWithColor:[UIColor whiteColor]];
    [viewController.navigationController.navigationBar setBackgroundImage:image                                                 forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
}
/*
 *返回上一级
 */


- (void)back
{
    [SVProgressHUD dismiss];
    [self popViewControllerAnimated:YES];
    //更改导航栏颜色
    UIImage *image =[UIImage imageWithColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBackgroundImage:image                                                 forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
