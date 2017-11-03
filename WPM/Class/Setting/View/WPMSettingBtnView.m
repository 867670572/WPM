//
//  WPMSettingBtnView.m
//  WPM
//
//  Created by Dream on 2017/10/30.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMSettingBtnView.h"

@implementation WPMSettingBtnView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width - 60;
        CGFloat height = (frame.size.height - 130)/ 5;
        _connectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _connectBtn.frame = CGRectMake(40, 10, width, height);
        [self addSubview:_connectBtn];
        _settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _settingBtn.frame = CGRectMake(40, 10+5 + height, width, height);
        [self addSubview:_settingBtn];
        _cleaningBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cleaningBtn.frame = CGRectMake(40, (10 + height)*2, width, height);
        [self addSubview:_cleaningBtn];
        _appInstructionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _appInstructionBtn.frame = CGRectMake(40, (10 + height)*3 , width, height);
        [self addSubview:_appInstructionBtn];
        _informationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _informationBtn.frame = CGRectMake(40, (10 + height)*4, width, height);
        [self addSubview:_informationBtn];
        [_connectBtn setTitle:@"\t\tConnect" forState:UIControlStateNormal];
        [_settingBtn setTitle:@"\t\tSetting" forState:UIControlStateNormal];
        [_cleaningBtn setTitle:@"\t\tCleaning" forState:UIControlStateNormal];
        [_appInstructionBtn setTitle:@"\t\tApp Instruction" forState:UIControlStateNormal];
        [_informationBtn setTitle:@"\t\tInformation" forState:UIControlStateNormal];
        
        //前景图片
        [_connectBtn setImage:[UIImage imageNamed:@"fa-star-o"] forState:UIControlStateNormal];
        [_settingBtn setImage:[UIImage imageNamed:@"fa-star-o"] forState:UIControlStateNormal];
        [_cleaningBtn setImage:[UIImage imageNamed:@"fa-star-o"] forState:UIControlStateNormal];
        [_appInstructionBtn setImage:[UIImage imageNamed:@"fa-star-o"] forState:UIControlStateNormal];
        [_informationBtn setImage:[UIImage imageNamed:@"fa-star-o"] forState:UIControlStateNormal];
        
        
        _connectBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _settingBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _cleaningBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _appInstructionBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _informationBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        //调整图片跟文字的距离
        [_connectBtn setImageEdgeInsets:UIEdgeInsetsMake(0,0, 0, 100)];
        [_settingBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 100)];
        [_cleaningBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 100)];
        [_appInstructionBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 100)];
        [_informationBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 100)];
    
       
        
    }
    return self;
}


@end
