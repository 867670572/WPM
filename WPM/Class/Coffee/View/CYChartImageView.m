//
//  CYChartImageView.m
//  WPM
//
//  Created by 刘文锋 on 2017/11/7.
//  Copyright © 2017年 Dream. All rights reserved.
//

#import "CYChartImageView.h"
#import "Masonry.h"

@implementation CYChartImageView

-(instancetype)init{
    self = [super init];
    if (self) {
        CGFloat chartWidth = 260;
        CGFloat chart_X = SCREEN_WIDTH/2-10-chartWidth/2;
        _chartView = [[CYChartView alloc] initWithFrame:CGRectMake(chart_X, 20, chartWidth, 140)];
        _chartView.backgroundColor = [UIColor clearColor];
        [self addSubview:_chartView];
        UILabel *p = [[UILabel alloc] initWithFrame:CGRectMake(chart_X, 0, 30, 20)];
        p.text = @"P";
        p.font = [UIFont systemFontOfSize:16.f weight:2.0];
        p.textColor = [UIColor whiteColor];
        p.textAlignment = NSTextAlignmentCenter;
        [self addSubview:p];
        
//        UILabel *T = [[UILabel alloc] initWithFrame:CGRectMake(300-30, 140-20, 30, 20)];
//        T.text = @"T";
//        T.font = [UIFont systemFontOfSize:16.f weight:2.0];
//        T.textColor = [UIColor whiteColor];
        UILabel *T = [[UILabel alloc] init];
        T.text = @"T";
        T.font = [UIFont systemFontOfSize:16.f weight:2.0];
        T.textColor = [UIColor whiteColor];
        T.textAlignment = NSTextAlignmentCenter;
        [self addSubview:T];
        
        __weak typeof(self) weakSelf = self;
        [T mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(weakSelf).offset(-10);
            make.left.mas_equalTo(weakSelf.chartView.mas_right);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];

        CGFloat pLabelWidth = 20;
        CGFloat PLabelHeight = 140/6.5;
        for (int i = 0; i < 7; i++) {
            UILabel *pLabel = [[UILabel alloc] initWithFrame:CGRectMake(chart_X-pLabelWidth, 20 +PLabelHeight*i, pLabelWidth, PLabelHeight)];
            pLabel.text = [NSString stringWithFormat:@"%d",7 - i];
            pLabel.font = [UIFont systemFontOfSize:14.f];
            pLabel.textColor = [UIColor whiteColor];
            pLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:pLabel];
        }
        
        CGFloat tLabelWidth = 260/8.5;
        CGFloat tLabelHeight = 20;
        for (int i = 0; i < 8; i++) {
            UILabel *tLabel = [[UILabel alloc] initWithFrame:CGRectMake(chart_X + tLabelWidth/2 + tLabelWidth*i, 160, tLabelWidth, tLabelHeight)];
            tLabel.text = [NSString stringWithFormat:@"%d",5*(i+1)];
            tLabel.font = [UIFont systemFontOfSize:14.f];
            tLabel.textColor = [UIColor whiteColor];
            tLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:tLabel];
        }
        
    }
    return self;
}

@end
