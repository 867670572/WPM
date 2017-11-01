//
//  BaseViewController.m
//  WPM
//
//  Created by 纬线 on 2017/10/24.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController
{
    id<UIGestureRecognizerDelegate> _delegate;
}

- (id)init{
    
    self = [super init];
    if (self) {
        self.canShowNavBackItem = YES;
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed: @"logo"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    self.navigationItem.titleView = imageView;
    if (self.canShowNavBackItem) {
        [self setNavBackButtonItem];
    }
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//    UINavigationBar *bar = self.navigationController.navigationBar;
//    [bar setHeight:88];
//
//
//
//    //调整导航栏标题的位置
//    [bar setTitleVerticalPositionAdjustment:-44 forBarMetrics:UIBarMetricsDefault];
//
//    //调整导航栏按钮的位置
//    UIBarButtonItem *item = self.navigationItem.leftBarButtonItem;
//    [item setBackgroundVerticalPositionAdjustment:-44 forBarMetrics:UIBarMetricsDefault];

    
    
    if (self.navigationController.viewControllers.count > 1) {
        // 记录系统返回手势的代理
        _delegate = self.navigationController.interactivePopGestureRecognizer.delegate;
        // 设置系统返回手势的代理为当前控制器
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 设置系统返回手势的代理为我们刚进入控制器的时候记录的系统的返回手势代理
    self.navigationController.interactivePopGestureRecognizer.delegate = _delegate;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.navigationController.childViewControllers.count > 1;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return self.navigationController.viewControllers.count > 1;
}
/**
 *  设置显示返回按钮
 *
 */
- (void)setNavBackButtonItem{
    
    
    self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationItem.hidesBackButton = YES;
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backBtn.frame = CGRectMake(0, 0, 15, 26);
    [self.backBtn setImage:[UIImage imageNamed:@"back icon"] forState:UIControlStateNormal];
    [self.backBtn addTarget:self action:@selector(navBackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn] ;
    self.navigationItem.leftBarButtonItem = backItem;
}

- (IBAction)navBackBtnClick:(id)sender{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    if (self.navigationController.viewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)popToLastVC{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

