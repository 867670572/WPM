//
//  MainTabBarController.m
//  FreshGoods
//
//  Created by chocolate_df on 2017/9/29.
//  Copyright © 2017年 Huang WenGuang. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseNavigationController.h"
#import "WPMCoffeeVC.h"
#import "WPMHomeVC.h"
#import "WPMCalendarVC.h"
#import "WPMSettingVC.h"

#define WPMMainColor [UIColor blueColor]

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self loadViewControllers];
    
}

- (void)loadViewControllers{
    
    WPMHomeVC *HomeVC = [[WPMHomeVC alloc]init];
//    CGFloat offset = 5.0;
//    HomeVC.tabBarItem.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
    [HomeVC setCanShowNavBackItem:NO];
    BaseNavigationController *nav1 = [[BaseNavigationController alloc]initWithRootViewController:HomeVC];

    WPMCalendarVC *CallendarVC = [[WPMCalendarVC alloc]init];
 
    [CallendarVC setCanShowNavBackItem:NO];
    BaseNavigationController *nav2 = [[BaseNavigationController alloc]initWithRootViewController:CallendarVC];

    WPMCoffeeVC *CoffeeVC = [[WPMCoffeeVC alloc]init];

    [CoffeeVC setCanShowNavBackItem:NO];
    BaseNavigationController *nav3 = [[BaseNavigationController alloc]initWithRootViewController:CoffeeVC];

    WPMSettingVC *SettingVC = [[WPMSettingVC alloc]init];
    BaseNavigationController *nav4 = [[BaseNavigationController alloc]initWithRootViewController:SettingVC];

    [SettingVC setCanShowNavBackItem:NO];

    [self setViewControllers:@[nav1,nav2,nav3,nav4] animated:YES];

    UITabBar *tabbar = self.tabBar;
    UITabBarItem *item1 = [tabbar.items objectAtIndex:0];
    UITabBarItem *item2 = [tabbar.items objectAtIndex:1];
    UITabBarItem *item3 = [tabbar.items objectAtIndex:2];
    UITabBarItem *item4 = [tabbar.items objectAtIndex:3];

    item1.selectedImage = [[UIImage imageNamed:@"首页选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"home icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    //拉伸item的图片
//    item1.imageInsets = UIEdgeInsetsMake(-6, 0, 6, 0);
//    //调整item文字位置
//    [item1 setTitlePositionAdjustment:UIOffsetMake(0, -5)];
//    item1.title = @"首页";

    item2.selectedImage = [[UIImage imageNamed:@"购物车满选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"calendar icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    item2.imageInsets = UIEdgeInsetsMake(-6, 0, 6, 0);
//    [item2 setTitlePositionAdjustment:UIOffsetMake(0, -5)];
//    item2.title = @"日记";

    item3.selectedImage = [[UIImage imageNamed:@"选中订单"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"coffee icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    item3.imageInsets = UIEdgeInsetsMake(-6, 0, 6, 0);
//    [item3 setTitlePositionAdjustment:UIOffsetMake(0, -5)];
//    item3.title = @"咖啡";

    item4.image = [[UIImage imageNamed:@"setting icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    item4.imageInsets = UIEdgeInsetsMake(-6, 0, 6, 0);
//    [item4 setTitlePositionAdjustment:UIOffsetMake(0, -5)];
//    item4.title = @"设置";


    //改变UITabBarItem字体颜色
    //未选中颜色
//    NSDictionary *normalItem = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14 weight:2.0f],NSFontAttributeName,[UIColor darkTextColor],NSForegroundColorAttributeName, nil];
//    [[UITabBarItem appearance] setTitleTextAttributes:normalItem forState:UIControlStateNormal];
    //选中颜色
    NSDictionary *selectedItem = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14 weight:2.0f],NSFontAttributeName,WPMMainColor,NSForegroundColorAttributeName, nil];
    [[UITabBarItem appearance] setTitleTextAttributes:selectedItem forState:UIControlStateSelected];

//    UIView *bgView = [[UIView alloc]initWithFrame:self.tabBar.bounds];
//    bgView.backgroundColor = [UIColor ];
//    [self.tabBar insertSubview:bgView atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
