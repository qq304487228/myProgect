//
//  BJTabBarController.m
//  Being_Object
//
//  Created by yaning Zhu on 16/5/31.
//  Copyright © 2016年 yaning Zhu. All rights reserved.
//

#import "BJTabBarController.h"

#import "BJNavigationController.h"

#import "BJCircleViewController.h"

#import "BJHouseViewController.h"

#import "BJMineViewController.h"

#import "BJKnowledgeViewController.h"
@interface BJTabBarController ()

@end

@implementation BJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTabbar];
    
}
- (void)setupTabbar{
    //知识
    BJKnowledgeViewController * knowledgeViewController= (BJKnowledgeViewController *)[self storyboard:@"Knowledge" Identifier:@"BFKnowledgeViewController"];
    [self addOneChlildVc:knowledgeViewController title:@"知识" imageName:@"knowledge" selectedImageName:@"knowledgeSel"];
    //健身房
    BJHouseViewController * houseViewController = (BJHouseViewController *)[self storyboard:@"house" Identifier:@"BJHouseViewController"];
    [self addOneChlildVc:houseViewController title:@"健身房" imageName:@"house" selectedImageName:@"houseSel"];
    //圈子
    BJCircleViewController * circleViewController = (BJCircleViewController *)[self storyboard:@"Circle" Identifier:@"BJCircleViewController"];
    [self addOneChlildVc:circleViewController title:@"健身圈" imageName:@"circle" selectedImageName:@"circleSel"];
    //我的
    
    BJMineViewController * mineViewController = (BJMineViewController *)[self storyboard:@"Mine" Identifier:@"BJMineViewController"];
    [self addOneChlildVc:mineViewController title:@"我的" imageName:@"mine" selectedImageName:@"mineSel"];
}
/**
 *  获得一个控制器 通过storyboard 和 标示
 */
- (UIViewController *)storyboard:(NSString *)storyboardName Identifier:(NSString *)identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}
/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.tabBarItem.title = title;
    childVc.navigationItem.title =title;
    UIImage *image = [UIImage imageNamed:imageName];
    
    // 声明这张图片用原图(别渲染)
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置图标
    childVc.tabBarItem.image = image;
    
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = mainTitleColor;
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    // 声明这张图片用原图(别渲染)
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVc.tabBarItem.selectedImage = selectedImage;
    BJNavigationController *nvc =[[BJNavigationController alloc]initWithRootViewController:childVc];
    // 添加为tabbar控制器的子控制器
    [self addChildViewController:nvc];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
