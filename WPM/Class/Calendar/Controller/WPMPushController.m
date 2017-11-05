//
//  WPMPushController.m
//  WPM
//
//  Created by Dream on 2017/10/26.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMPushController.h"
@interface WPMPushController()
@end

@implementation WPMPushController

//static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    if (self.block != nil) {
//        self.block(_titles);
//    }
    
    [self setupUI];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupUI{
    //系统编辑按钮
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
     _tabAlbum = [[WPMCalendarTableView alloc] initWithFrame:CGRectMake(10, 110,SCREEN_WIDTH -  20,SCREEN_HEIGHT - 110 - 64)];
    _tabAlbum.index = _titles;
    NSLog(@"%@",_tabAlbum.index);
    
    _headerView = [[WPMForHeaderView alloc]initWithFrameAndSelectday:CGRectMake(10, 64, SCREEN_WIDTH-20, 110) Selectday:self.titles];
    _headerView.hWDMY.text = self.weekDayMonthYear;
//    [self performSelector:@selector(blockClick) withObject:nil afterDelay:5];
    
    [self.view addSubview:_headerView];
    [self.view addSubview:_tabAlbum];
    
    //1. 实现block，使用__block的原因：是防止内存的泄露
    __weak typeof(self) weakSelf = self;
    //2. block的初始化
    _tabAlbum.block = ^(NSString *imgName) {
    //如果不用__block的对象，那么这里会提示一个警告 ------> 内存的
    WPMPushAlbumController *PAC = [[WPMPushAlbumController alloc] init];
    PAC.imgName = imgName;
    [weakSelf.navigationController pushViewController:PAC animated:YES];
    };
}
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    //开启tab编辑
    [_tabAlbum.tabAlbum setEditing:editing animated:animated];
}



@end

