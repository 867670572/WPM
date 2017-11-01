//
//  WPMForHeaderView.m
//  WPM
//
//  Created by Dream on 2017/10/27.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMForHeaderView.h"


@implementation WPMForHeaderView

- (id)initWithFrameAndSelectday:(CGRect)frame Selectday:(NSString *)selectday{
    self = [super initWithFrame:frame];
    if (self) {
        _hWeekHeadView = [[WPMCalenarWeekHeaderView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        _hWeekHeadView.backgroundColor = [UIColor colorWithWhite:0.8  alpha:0.1];
        [self addSubview:_hWeekHeadView];
        _hDayHeadView = [[WPMSingleWeekView alloc] initWithFrameAndSelectday:CGRectMake(0, 30, frame.size.width, 40) Selectday: selectday];
        _hDayHeadView.backgroundColor = [UIColor colorWithWhite:0.8  alpha:0.1];
        [self addSubview:_hDayHeadView];
        _hWDMY = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, frame.size.width, 40)];
        _hWDMY.font = [UIFont boldSystemFontOfSize:20];
        _hWDMY.textColor = HEXCOLOR(0x19A79D);;
        _hWDMY.backgroundColor = [UIColor colorWithWhite:1  alpha:0.1];
        _hWDMY.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_hWDMY];
    }
    return self;
}

@end
