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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    WPMSettingBtnView *SBV = [[WPMSettingBtnView alloc] initWithFrame:CGRectMake(10, 200, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 200)];
    _label = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, (200-40)/2, 100, 40)];
    _label.text = @"KD-310VP+";
    _label.textColor = [UIColor whiteColor];
    [_imgView addSubview:_label];
    SBV.backgroundColor = [UIColor colorWithWhite:1  alpha:0.1];
    [self.view addSubview:SBV];
    [self.view addSubview:_imgView];
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
