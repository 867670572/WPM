//
//  WPMAlbumSearchVCViewController.m
//  WPM
//
//  Created by Dream on 2017/10/30.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMAlbumSearchVC.h"

@interface WPMAlbumSearchVC ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    //测试数据
    NSArray *arr;
}

@end

@implementation WPMAlbumSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self setupUI];
}
- (void)setupUI{
    //系统编辑按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _albumModel = [[WPMAlbumModel alloc] init];
    _searchTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH - 70, 30)];
    _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _searchBtn.frame = CGRectMake(SCREEN_WIDTH - 50 + 5, 64, 30, 30);
    [_searchBtn setBackgroundImage:[UIImage imageNamed:@"SearchContactsBarIcon"] forState:UIControlStateNormal];
    
    //[_searchBtn setBackgroundImage:[UIImage imageNamed:@"VoiceSearchStartBtnHL"] forState:UIControlStateSelected];
    
    _searchTF.delegate = self;
    _searchTF.backgroundColor = [UIColor whiteColor];
    _searchTF.placeholder = @"Search";
    [_searchTF setClearButtonMode:UITextFieldViewModeWhileEditing];
    //边框
    _searchTF.borderStyle = UITextBorderStyleRoundedRect;
    //自己加边框
    _searchTF.layer.borderColor = [UIColor cyanColor].CGColor;
    _searchTF.layer.borderWidth = 2;
    _searchTF.layer.cornerRadius = 5;
    _searchTF.layer.masksToBounds = YES;
    [self.view addSubview:_searchBtn];
    [self.view addSubview:_searchTF];
    [_searchBtn addTarget:self action:@selector(searchBagin) forControlEvents:UIControlEventTouchUpInside];
    [self setupAlbumTableView];
}
- (void)setupAlbumTableView{
    _tabAlbum = [[UITableView alloc] initWithFrame:CGRectMake(0, 94,SCREEN_WIDTH,SCREEN_HEIGHT - 30 -64) style:UITableViewStylePlain];
    _tabAlbum.delegate = self;
    _tabAlbum.dataSource = self;
    _tabAlbum.backgroundColor = [UIColor clearColor];
    //取消显示分割线
    _tabAlbum.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tabAlbum];
    
    //添加手势
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gestureRecognizer.numberOfTapsRequired = 1;
    gestureRecognizer.cancelsTouchesInView = NO;
    [_tabAlbum addGestureRecognizer:gestureRecognizer];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    
    WPMAlbumTVCell *cell = [_tabAlbum dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[WPMAlbumTVCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    //选中不变色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    //创建相册对象
    _album = [_mArrSearchDate objectAtIndex:indexPath.row];
    
    cell.backgroundColor = [UIColor colorWithWhite:1  alpha:0.1];
    cell.IDLabel.text = [NSString stringWithFormat:@"%ld\n\n",indexPath.row + 1];;
    cell.IDLabel.backgroundColor = [UIColor redColor];
    cell.IDLabel.textAlignment = NSTextAlignmentCenter;
    cell.IDLabel.numberOfLines = 3;
    cell.IDLabel.textColor = [UIColor whiteColor];
    
    NSString *imgName = [NSString stringWithFormat:@"%@",_album.diaryImage];
    cell.photoIV.image = [UIImage imageNamed:imgName];
    cell.statusLabel.text = _album.status;
    cell.statusLabel.textAlignment = NSTextAlignmentRight;
    cell.statusLabel.textColor = [UIColor whiteColor];
    cell.dateLabel.text = _album.date;
    cell.dateLabel.textAlignment = NSTextAlignmentRight;
    cell.dateLabel.textColor = [UIColor whiteColor];
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _mArrSearchDate.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}



- (void)searchBagin{
    _mArrSearchDate = nil;
    NSArray *allKays = [_albumModel.mdicAlbum allKeys];
    NSLog(@"%@--------------",_searchTF.text);
    [_searchTF resignFirstResponder];
    for (int i = 0; i < allKays.count; i++) {
        if ([_searchTF.text isEqualToString:[allKays objectAtIndex:i]]) {
            _mArrSearchDate = [NSMutableArray array];
            _mArrSearchDate = [_albumModel.mdicAlbum objectForKey:[allKays objectAtIndex:i]];
            [_tabAlbum reloadData];
            break;
        }
    }
    [_tabAlbum reloadData];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //textField放弃第一响应者 （收起键盘）
    //键盘是textField的第一响应者
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_searchTF resignFirstResponder];
}
//点击tableview收起键盘
- (void) hideKeyboard {
    [_searchTF resignFirstResponder];
}

//点击编辑按钮执行
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    //开启tab编辑
    [_tabAlbum setEditing:editing animated:animated];
}

@end
