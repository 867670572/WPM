//
//  WPMSettingVC.m
//  WPM
//
//  Created by 纬线 on 2017/10/24.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMSettingVC.h"
#import "WPMSettingBtnView.h"

@interface WPMSettingVC ()

@end

@implementation WPMSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 100 + 32 + 30,  SCREEN_WIDTH - 60, 60)];

    WPMSettingBtnView *SBV = [[WPMSettingBtnView alloc] initWithFrame:CGRectMake(10, 100 + 32 + 30 + 60 + 20, SCREEN_WIDTH - 20, SCREEN_HEIGHT - (100 + 32 + 30 + 60 + 20 + 59))];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 60, 60)];
    _label.text = @"KD-310VP+";
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.backgroundColor = [UIColor darkGrayColor];
    [_imgView addSubview:_label];
    SBV.backgroundColor = [UIColor colorWithWhite:1  alpha:0.1];
    [SBV.connectBtn addTarget:self action:@selector(touchConnectBtn) forControlEvents:UIControlEventTouchUpInside];
    [SBV.settingBtn addTarget:self action:@selector(touchSettingBtn) forControlEvents:UIControlEventTouchUpInside];
    [SBV.cleaningBtn addTarget:self action:@selector(touchCleaningBtn) forControlEvents:UIControlEventTouchUpInside];
    [SBV.appInstructionBtn addTarget:self action:@selector(touchAppInstructionBtn) forControlEvents:UIControlEventTouchUpInside];
    [SBV.informationBtn addTarget:self action:@selector(touchInformationBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:SBV];
    [self.view addSubview:_imgView];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchConnectBtn{
    
}
- (void)touchSettingBtn{
    NSLog(@"点尼玛");
    WPMSettingPushSettingVC *SPSVC = [[WPMSettingPushSettingVC alloc]init];
    [self.navigationController pushViewController:SPSVC animated:YES];
    
}
- (void)touchCleaningBtn{
    
}
- (void)touchAppInstructionBtn{
    
}
- (void)touchInformationBtn{
    
}

@end
