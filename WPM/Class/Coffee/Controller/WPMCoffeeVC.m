//
//  WPMCoffeeVC.m
//  WPM
//
//  Created by 纬线 on 2017/10/24.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMCoffeeVC.h"
#import "Masonry.h"
#import "CYByteManager.h"
#import "CDZPicker.h"

@interface WPMCoffeeVC ()
@property (nonatomic,strong) UIButton *oneCupButton;
@property (nonatomic,strong) UIButton *twoCupButton;
@property (nonatomic,assign) BOOL isOneCup;
@property (nonatomic,strong) UILabel *tempLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *pressureLabel;
@property (nonatomic,strong) UIButton *stageButton;
@property (nonatomic,strong) UIButton *openButton;
@property (nonatomic,strong) UIButton *saveButton;
@end

@implementation WPMCoffeeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isOneCup = YES;
    [self setUI];
    
}
- (void)setUI{
    UIView *backgroudView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    backgroudView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:backgroudView];
    [backgroudView addSubview:self.oneCupButton];
    [backgroudView addSubview:self.twoCupButton];
    
    UILabel *oneCupLabel = [[UILabel alloc] init];
    oneCupLabel.text = @"1CUP";
    oneCupLabel.font = [UIFont systemFontOfSize:14.f weight:2];
    oneCupLabel.textColor = [UIColor whiteColor];
    [backgroudView addSubview:oneCupLabel];
    
    UILabel *twoCupLabel = [[UILabel alloc] init];
    twoCupLabel.text = @"2CUPS";
    twoCupLabel.font = [UIFont systemFontOfSize:14.f weight:2];
    twoCupLabel.textColor = [UIColor whiteColor];
    [backgroudView addSubview:twoCupLabel];
    
    UIImageView *tempImageView = [[UIImageView alloc] init];
//    tempImageView.backgroundColor = [UIColor lightGrayColor];
    tempImageView.image = [UIImage imageNamed:@"circle half bg"];
    [backgroudView addSubview:tempImageView];
    
    [tempImageView addSubview:self.tempLabel];
    [tempImageView addSubview:self.timeLabel];
    
    UIImageView *pressureImageView = [[UIImageView alloc] init];
    pressureImageView.image = [UIImage imageNamed:@"circle red bg"];
    [backgroudView addSubview:pressureImageView];
    
    [pressureImageView addSubview:self.pressureLabel];
    
    
    UIImageView *stageImageView = [[UIImageView alloc] init];
    stageImageView.image = [UIImage imageNamed:@"bg1"];
    stageImageView.userInteractionEnabled = YES;
    [backgroudView addSubview:stageImageView];
    
    [stageImageView addSubview:self.stageButton];
    [stageImageView addSubview:self.openButton];
    [stageImageView addSubview:self.saveButton];
    
    
    
    __weak typeof(self) weakSelf = self;
    [oneCupLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backgroudView).offset(80);
        make.right.mas_equalTo(backgroudView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
    
    [self.oneCupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(oneCupLabel);
        make.right.mas_equalTo(oneCupLabel.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.twoCupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(oneCupLabel);
        make.left.mas_equalTo(backgroudView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [twoCupLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(oneCupLabel);
        make.left.mas_equalTo(weakSelf.twoCupButton.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
    
    [tempImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(oneCupLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(backgroudView.mas_centerX).offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self.tempLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(tempImageView.mas_centerY).offset(-5);
        make.centerX.mas_equalTo(tempImageView);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
    

    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tempImageView.mas_centerY).offset(5);
        make.centerX.mas_equalTo(tempImageView);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
    
    [pressureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(tempImageView);
        make.left.mas_equalTo(backgroudView.mas_centerX).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self.pressureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(pressureImageView);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
    
    [stageImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(pressureImageView.mas_bottom).offset(40);
        make.left.mas_equalTo(backgroudView).offset(20);
        make.right.mas_equalTo(backgroudView).offset(-20);
        make.height.mas_equalTo(60);
    }];
    
    [self.stageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(stageImageView).offset(10);
        make.left.mas_equalTo(stageImageView).offset(10);
        make.bottom.mas_equalTo(stageImageView).offset(-10);
    }];
    
    [self.openButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.stageButton);
        make.left.mas_equalTo(weakSelf.stageButton.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.stageButton);
        make.left.mas_equalTo(weakSelf.openButton.mas_right).offset(10);
        make.right.mas_equalTo(stageImageView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];

    
}

#pragma mark - button click method
-(void)clickOneCupButton:(UIButton *)button{
    
    if (self.isOneCup) {
        
    }else{
        button.selected = !button.selected;
        self.twoCupButton.selected = !self.twoCupButton.selected;
        self.isOneCup = !self.isOneCup;
    }
}
-(void)clickTwoCupButton:(UIButton *)button{
    
    if (self.isOneCup) {
        button.selected = !button.selected;
        self.oneCupButton.selected = !self.oneCupButton.selected;
        self.isOneCup = !self.isOneCup;
    }
}
- (void)clickStageButton:(UIButton *)button{
    NSArray *array = @[@"Stage1",@"Stage2",@"Stage3",@"Stage4"];
    __weak typeof(self) weakSelf = self;
    [CDZPicker showPickerInView:self.view withObjectsArray:array withCancelBlock:^{
        
    } withConfirmBlock:^(NSString *string) {
        [weakSelf.stageButton setTitle:string forState:UIControlStateNormal];
    }];
}

- (void)clickOpenButton:(UIButton *)button{
    NSLog(@"点击 open");
}

- (void)clickSaveButton:(UIButton *)button{
    NSLog(@"点击 save");
}
#pragma mark - lazyload

-(UIButton *)oneCupButton{
    if (!_oneCupButton) {
        _oneCupButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_oneCupButton setImage:[UIImage imageNamed:@"green_l light"] forState:UIControlStateNormal];
        [_oneCupButton setImage:[UIImage imageNamed:@"red_l light"] forState:UIControlStateSelected];
        _oneCupButton.selected = self.isOneCup;
        [_oneCupButton addTarget:self action:@selector(clickOneCupButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _oneCupButton;
}
-(UIButton *)twoCupButton{
    if (!_twoCupButton) {
        _twoCupButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_twoCupButton setImage:[UIImage imageNamed:@"green_l light"] forState:UIControlStateNormal];
        [_twoCupButton setImage:[UIImage imageNamed:@"red_l light"] forState:UIControlStateSelected];
        [_twoCupButton addTarget:self action:@selector(clickTwoCupButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _twoCupButton;
}
-(UILabel *)tempLabel{
    if (!_tempLabel) {
        _tempLabel = [[UILabel alloc] init];
        _tempLabel.text = @"90C";
        _tempLabel.font = [UIFont systemFontOfSize:20.f weight:2];
        _tempLabel.textAlignment = NSTextAlignmentCenter;
        _tempLabel.textColor = [UIColor whiteColor];
    }
    return _tempLabel;
}
-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"02s";
        _timeLabel.font = [UIFont systemFontOfSize:16.f weight:2];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.textColor = [UIColor whiteColor];
    }
    return _timeLabel;
}
-(UILabel *)pressureLabel{
    if (!_pressureLabel) {
        _pressureLabel = [[UILabel alloc] init];
        _pressureLabel.text = @"LV3";
        _pressureLabel.font = [UIFont systemFontOfSize:20.f weight:2];
        _pressureLabel.textAlignment = NSTextAlignmentCenter;
        _pressureLabel.textColor = [UIColor whiteColor];
    }
    return _pressureLabel;
}

-(UIButton *)stageButton{
    if (!_stageButton) {
        _stageButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_stageButton setImage:[UIImage imageNamed:@"green_l light"] forState:UIControlStateNormal];
//        [_stageButton setImage:[UIImage imageNamed:@"red_l light"] forState:UIControlStateSelected];
        _stageButton.backgroundColor = [UIColor whiteColor];
        [_stageButton.layer setBorderWidth:2.0];
        [_stageButton.layer setBorderColor:[UIColor colorWithRed:36/255.f green:162/255.f blue:153/255.f alpha:1].CGColor];
        _stageButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_stageButton setTitle:@"Stage1" forState:UIControlStateNormal];
        _stageButton.titleLabel.font = [UIFont systemFontOfSize:14.f weight:2.0];
        [_stageButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [_stageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_stageButton addTarget:self action:@selector(clickStageButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _stageButton;
}

-(UIButton *)openButton{
    if (!_openButton) {
        _openButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_openButton setImage:[UIImage imageNamed:@"open icon"] forState:UIControlStateNormal];
//        [_openButton setImage:[UIImage imageNamed:@"red_l light"] forState:UIControlStateSelected];
        
        [_openButton addTarget:self action:@selector(clickOpenButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openButton;
}

-(UIButton *)saveButton{
    if (!_saveButton) {
        _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_saveButton setImage:[UIImage imageNamed:@"save icon"] forState:UIControlStateNormal];
//        [_saveButton setImage:[UIImage imageNamed:@"red_l light"] forState:UIControlStateSelected];
        
        [_saveButton addTarget:self action:@selector(clickSaveButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveButton;
}
@end
