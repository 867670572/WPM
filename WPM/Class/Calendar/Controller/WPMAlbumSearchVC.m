//
//  WPMAlbumSearchVCViewController.m
//  WPM
//
//  Created by Dream on 2017/10/30.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMAlbumSearchVC.h"

@interface WPMAlbumSearchVC ()<UITextFieldDelegate>

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
    
}
- (void)setupAlbumTableView{
    _tabAlbum = [[WPMCalendarTableView alloc] initWithFrame:CGRectMake(10, 70,SCREEN_WIDTH - 20,SCREEN_HEIGHT - 30 - 64) ];
    _tabAlbum.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tabAlbum];

    //添加手势
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gestureRecognizer.numberOfTapsRequired = 1;
    gestureRecognizer.cancelsTouchesInView = NO;
    [_tabAlbum addGestureRecognizer:gestureRecognizer];
}


- (void)searchBagin{
    
    [_searchTF resignFirstResponder];
    [self setupAlbumTableView];
    _tabAlbum.index = _searchTF.text;
        
    [_tabAlbum.tabAlbum reloadData];
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
    [_tabAlbum.tabAlbum setEditing:editing animated:animated];
}

@end
