//
//  WPMPushAlbumController.m
//  WPM
//
//  Created by Dream on 2017/10/30.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMPushAlbumController.h"

@interface WPMPushAlbumController ()

@end

@implementation WPMPushAlbumController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    [self setupUI];
    
}
- (void)setupUI{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH-20, 364)];
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 464, SCREEN_WIDTH-20, SCREEN_HEIGHT-464)];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.textColor = [UIColor whiteColor];
    _imgView.image = [UIImage imageNamed:_imgName];
    _textView.text = @"     垃圾";
    _textView.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_imgView];
    [self.view addSubview:_textView];
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
