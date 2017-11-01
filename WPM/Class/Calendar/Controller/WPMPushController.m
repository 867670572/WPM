//
//  WPMPushController.m
//  WPM
//
//  Created by Dream on 2017/10/26.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMPushController.h"
#import "WPMAlbumTVCell.h"
#import "WPMForHeaderView.h"



@interface WPMPushController ()<UITableViewDelegate,UITableViewDataSource>
{
    //测试数据
    NSArray *arr;
}
@property (nonatomic,strong) UITableView *tabAlbum;
@property (nonatomic,strong) WPMForHeaderView *headerView;


@end

@implementation WPMPushController

//static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupUI{
    //系统编辑按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _tabAlbum = [[UITableView alloc] initWithFrame:CGRectMake(0, 174,SCREEN_WIDTH,SCREEN_HEIGHT - 110-64) style:UITableViewStylePlain];
    _tabAlbum.delegate = self;
    _tabAlbum.dataSource = self;
    _tabAlbum.backgroundColor = [UIColor clearColor];
    _headerView = [[WPMForHeaderView alloc]initWithFrameAndSelectday:CGRectMake(10, 64, SCREEN_WIDTH-20, 110) Selectday:self.titles];
    _headerView.hWDMY.text = self.weekDayMonthYear;
    
    _PAC = [[WPMPushAlbumController alloc] init];
    
    arr = @[@"Strong",@"Strong",@"Strong",@"Normal",@"Light",@"Normal",@"Light",@"Light"];
    [self.view addSubview:_headerView];
    [self.view addSubview:_tabAlbum];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    WPMAlbumTVCell *cell = [_tabAlbum dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[WPMAlbumTVCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    //选中不变色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //取消显示分割线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.IDLabel.text = [NSString stringWithFormat:@"%ld\n\n",indexPath.row + 1];;
    cell.IDLabel.backgroundColor = [UIColor redColor];
    cell.IDLabel.textAlignment = NSTextAlignmentCenter;
    cell.IDLabel.numberOfLines = 3;
    cell.IDLabel.textColor = [UIColor whiteColor];
    NSString *imgName = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.photoIV.image = [UIImage imageNamed:imgName];
    cell.statusLabel.text = arr[indexPath.row];
    cell.statusLabel.textAlignment = NSTextAlignmentRight;
    cell.statusLabel.textColor = [UIColor whiteColor];
    cell.dateLabel.text = self.titles;
    cell.dateLabel.textAlignment = NSTextAlignmentRight;
    cell.dateLabel.textColor = [UIColor whiteColor];
    return cell;
    
 
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _PAC.imgName = [NSString stringWithFormat:@"%ld",indexPath.row];
    [self.navigationController pushViewController:_PAC animated:YES];
}

//点击编辑按钮执行
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    //开启tab编辑
    [_tabAlbum setEditing:editing animated:animated];
}


@end

