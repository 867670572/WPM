//
//  WPMSettingPushSettingVC.m
//  WPM
//
//  Created by Dream on 2017/11/2.
//  Copyright © 2017年 Dream. All rights reserved.
//

#import "WPMSettingPushSettingVC.h"

@interface WPMSettingPushSettingVC ()

@end

@implementation WPMSettingPushSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}
- (void)setupUI{
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 100 + 32 + 30,  SCREEN_WIDTH - 60, 60)];
    
//    WPMSettingBtnView *SBV = [[WPMSettingBtnView alloc] initWithFrame:CGRectMake(10, 100 + 32 + 30 + 60 + 20, SCREEN_WIDTH - 20, SCREEN_HEIGHT - (100 + 32 + 30 + 60 + 20 + 59))];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 60, 60)];
    _label.text = @"Setting";
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.backgroundColor = [UIColor darkGrayColor];
    [_imgView addSubview:_label];
    [self.view addSubview:_imgView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
