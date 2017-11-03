//
//  SelectView.m
//  WPM
//
//  Created by Dream on 2017/11/2.
//  Copyright © 2017年 Dream. All rights reserved.
//
/*
 直接将控件添加到tableviewcell里，需要cell的数量较少，需要创建相对应的控件，需且用数组存起来，取消重用池，不变滑动时数据错乱。
 */
#import "SelectView.h"

@interface SelectView ()<UITableViewDelegate,UITableViewDataSource>
{
    //测试数组
    NSArray *arr;
    
    //指针转换
    UIButton *btn1;
    UIButton *btn0;
    UILabel *label0;
}

@end


@implementation SelectView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI:frame];
    }
    return self;
}
- (void)setupUI:(CGRect)frame{
    _tabMachine = [[UITableView alloc] initWithFrame:CGRectMake(0,0, frame.size.width,frame.size.height - 30 - 30 - 20) style:UITableViewStyleGrouped];
    _tabMachine.delegate = self;
    _tabMachine.dataSource = self;
    _tabMachine.backgroundColor = self.backgroundColor;
    _tabMachine.showsVerticalScrollIndicator = NO;
    [self addSubview:_tabMachine];
    _mArrSelectBtn = [NSMutableArray array];
    _mArrLabel = [NSMutableArray array];
    arr = @[@"KD-310VP+A",@"KD-310VP+B",@"KD-310VP+C",@"KD-310VP+D",@"KD-310VP+E",@"KD-310VP+F",@"KD-310VP+G"];
    _connectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _refreshBtn.frame = CGRectMake(20, frame.size.height - 30 - 30, (frame.size.width - 20 - 20 - 40)/2, 30);
    _connectBtn.frame = CGRectMake((frame.size.width - 20 - 20 - 40)/2 + 20 + 40, frame.size.height - 30 - 30, (frame.size.width - 20 - 20 - 40)/2, 30);
    _connectBtn.backgroundColor = [UIColor redColor];
    _refreshBtn.backgroundColor = [UIColor redColor];
    [_connectBtn setTitle:@"Connect" forState:UIControlStateNormal];
    [_refreshBtn setTitle:@"Refresh" forState:UIControlStateNormal];
    [_refreshBtn addTarget:self action:@selector(touchRefresh)  forControlEvents:UIControlEventTouchUpInside];
    [_connectBtn addTarget:self action:@selector(touchConnect)  forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:_refreshBtn];
    [self addSubview:_connectBtn];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    //取消重用池
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //选中不变色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //取消显示分割线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.1];
    btn0 =  [_mArrSelectBtn objectAtIndex:indexPath.section];
    if ( btn0.tag == indexPath.section + 100) {
        [cell addSubview:btn0];
    }
    label0 = [_mArrLabel objectAtIndex:indexPath.section];
    label0.text = arr[indexPath.section];
    if (label0.tag == indexPath.section + 100) {
        [cell addSubview:label0];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    for (int i = 0; i < arr.count; i++) {
        //button
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectBtn.tag = 100 + i;
        [_mArrSelectBtn addObject:_selectBtn];
        _selectBtn.frame = CGRectMake(0, 0, 40,40);
        _selectBtn.backgroundColor = [UIColor redColor];
        [_selectBtn setBackgroundImage:[UIImage imageNamed:@"fa-star-o"] forState:UIControlStateSelected];
        //label
        _label = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 130, 40)];
        _label.tag = 100 + i;
        _label.textColor = [UIColor whiteColor];
        [_mArrLabel addObject:_label];
        _label.adjustsFontSizeToFitWidth = YES;
    }
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    btn0 = [_mArrSelectBtn objectAtIndex:indexPath.section];
    if (btn0.tag == 100 + indexPath.section && btn0.selected == NO) {
        btn0.selected = YES;
        if (btn0 == btn1) {
            btn1 = nil;
        }
    }
    btn1.selected = NO;
    btn1 = btn0;
    
    
}

- (void)touchRefresh{
    [_tabMachine reloadData];
}
- (void)touchConnect{
    
}

@end
