//
//  WPMHomeVC.m
//  WPM
//
//  Created by 纬线 on 2017/10/24.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMHomeVC.h"

@interface WPMHomeVC ()

@end

@implementation WPMHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:1.0];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    [self setupLiftLogo];
    [self setupUI];
    
}

- (void)setupLiftLogo{
    UIButton *logoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    logoBtn.frame = CGRectMake(0, 0, 15, 26);
    [logoBtn setImage:[UIImage imageNamed:@"logo"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:logoBtn];
    [logoBtn setUserInteractionEnabled:NO];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)setupUI{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, SCREEN_WIDTH- 60, 32)];
    label.text = @"Select Your Machine";
    label.font = [UIFont boldSystemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.shadowColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake(5, 5);
    label.adjustsFontSizeToFitWidth = YES;
    _sv = [[SelectView alloc] initWithFrame:CGRectMake(50, 100 + 32 + 30, SCREEN_WIDTH - 100, SCREEN_HEIGHT - (100 + 32 + 30) - 49)];
    _sv.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];
    
    _selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100 + 32 + 30, SCREEN_WIDTH - 60, 60)];
    _selectBtn.backgroundColor = [UIColor darkGrayColor];
    [_selectBtn setTitle:@"KD-310VP+" forState:UIControlStateNormal];
    [_selectBtn addTarget:self action:@selector(selectGo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_selectBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//重写viewWillAppear
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
- (void)selectGo{
    _selectBtn.hidden = YES;
    [self.view addSubview:_sv];
}

@end
