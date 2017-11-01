//
//  BaseNavigationController.m
//  FreshGoods
//
//  Created by chocolate_df on 2017/9/28.
//  Copyright © 2017年 Huang WenGuang. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加中间logo
    
    //显示状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    //设置导航栏字体
//    NSDictionary *fontAttr = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:18],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName, nil];
//    [self.navigationBar setTitleTextAttributes:fontAttr];
    
    
    
    //设置导航栏颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}





//重写push方法
//处理tabbar的显示和隐藏
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count == 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
