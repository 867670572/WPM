//
//  WPMCalenarWeekHeaderView.m
//  WPM
//
//  Created by Dream on 2017/10/27.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMCalenarWeekHeaderView.h"

@implementation WPMCalenarWeekHeaderView

/** 设置星期条，显示 日 一 二 ... 五 六 */
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat height = frame.size.height;
        CGFloat width = (SCREEN_WIDTH - 20) / 7.0;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        //    view.backgroundColor = HEXCOLOR(0xF6F6F6);
        view.backgroundColor = [UIColor clearColor];

        [self addSubview:view];
        NSArray *weekArray = @[@"S", @"M", @"T", @"W", @"T", @"F", @"S"];
        for (int i = 0; i < 7; ++i) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
            label.backgroundColor = [UIColor clearColor];
            label.text = weekArray[i];
            if ([label.text isEqualToString:@"S"]) {
                label.textColor = HEXCOLOR(0xFF5A39);
            } else {
                label.textColor = [UIColor whiteColor];
            }
            label.font = [UIFont fontWithName:@"PingFang SC" size:13.5];
            label.textAlignment = NSTextAlignmentCenter;
            
            [view addSubview:label];
        }
        
    }
    return self;
    
}

@end
