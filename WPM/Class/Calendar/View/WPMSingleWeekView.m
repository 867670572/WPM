//
//  WPMSingleWeekView.m
//  WPM
//
//  Created by Dream on 2017/10/28.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMSingleWeekView.h"

@implementation WPMSingleWeekView

- (id)initWithFrameAndSelectday:(CGRect)frame Selectday:(NSString *)selectday {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat height = frame.size.height;
        CGFloat width = (SCREEN_WIDTH - 20) / 7.0;
        _singleWeekView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        [self addSubview:_singleWeekView];
        UILabel *label;
        for (int i = 0; i < 7; ++i) {
            label = [[UILabel alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
            label.backgroundColor = [UIColor clearColor];
            label.tag = 100 + i;
            label.font = [UIFont fontWithName:@"PingFang SC" size:13.5];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            [self labelShowdataFromTag:label.tag NowDate:selectday frame:frame];
            [_singleWeekView addSubview:label];
        }
        for (int i = 0; i < 7; ++i) {
            label.text = [self labelShowdataFromTag:100 + i NowDate:selectday frame:frame];
            NSLog(@"%@",label.text);
        }
    }
    return self;
}
//tag转str
- (NSString *)tagChangeStr:(NSInteger)tag{
    switch (tag) {
        case 101:
            return @"Monday";
            break;
        case 102:
            return @"Tuesday";
            break;
        case 103:
            return @"Wednesday";
            break;
        case 104:
            return @"Thursday";
            break;
        case 105:
            return @"Friday";
            break;
        case 106:
            return @"Saturday";
            break;
        default:
            return @"Sunday";
            break;
    }
}
//在日/月/年格式中  转换 提取日  月  年
- (NSArray *)dateChangeStr:(NSString *)str{
    NSString *day = [str substringToIndex:2];
    NSString *month = [str substringWithRange:NSMakeRange(3, 2)];
    NSString *year = [str substringFromIndex:6];
    BOOL boolDay = [day containsString:@"/"];
    BOOL boolMonthEnd = [month hasSuffix:@"/"];
    BOOL boolMonthFirst = [month hasPrefix:@"/"];
    //如果日是单数月是双数时
    if (boolDay&&boolMonthEnd) {
        day = [str substringToIndex:1];
        month = [str substringWithRange:NSMakeRange(2, 2)];
        year = [str substringFromIndex:5];
    }
    //如果日和月都是单数时
    if (boolMonthFirst) {
        day = [str substringToIndex:1];
        month = [str substringWithRange:NSMakeRange(2, 1)];
        year = [str substringFromIndex:4];
    }
    //如果月是单数日是双数时
    if ((!boolDay)&&boolMonthEnd) {
        month = [str substringWithRange:NSMakeRange(3, 1)];
        year = [str substringFromIndex:5];
    }
    NSString *YMD = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
    NSArray *dayData = [NSArray arrayWithObjects:YMD,year,month,day, nil];
    return dayData;
}

//nowDay == selectday == 日/月/年
//控制label显示该显示的数据
- (NSString *)labelShowdataFromTag:(NSInteger)tag NowDate:(NSString*)nowDate frame:(CGRect)frame{
    CGFloat height = frame.size.height;
    CGFloat width = (SCREEN_WIDTH - 20) / 7.0;
    //标志今天小圆点
    UIView *pointView = [[UIView alloc] init];
    pointView.layer.cornerRadius = 0.5 * (height-14);
    pointView.backgroundColor = HEXCOLOR(0x19A79D);
    
    //字符串格式转换
    //年-月-日
    NSString *selectdayD = [self dateChangeStr:nowDate][0];
    //得到对应的周几
    NSString *selectdayWD = [WPMCalendarVC weekdayStringFromDate:selectdayD];
    //创建新的tag接收
    NSInteger nowDayTag;
    //选中的日期
    NSString *nowDay = [self dateChangeStr:nowDate][3];
    NSInteger nowDayInt = [nowDay intValue];
    
    //日期0-6
    NSString *day1;
    NSString *day2;
    NSString *day3;
    NSString *day4;
    NSString *day5;
    NSString *day6;
    NSString *day0;
    if ([selectdayWD isEqualToString:[self tagChangeStr:tag]]){
        pointView.frame = CGRectMake((tag - 100) * width+(width-height+14)*0.5, 7 ,height-14,height-14);
        nowDayTag = tag;
        [_singleWeekView addSubview:pointView];
    }if(nowDayTag == 100) {
        nowDayInt = ABS(nowDayInt- ABS(nowDayTag - tag));
        day0 = [NSString stringWithFormat:@"%ld",nowDayInt];
        return day0;
    }
    if(nowDayTag == 101){
        nowDayInt = ABS(nowDayInt- ABS(nowDayTag - tag));
        day1 = [NSString stringWithFormat:@"%ld",nowDayInt];
        return day1;
    }
    if(nowDayTag == 102){
        nowDayInt = ABS(nowDayInt- ABS(nowDayTag - tag));
        day2 = [NSString stringWithFormat:@"%ld",nowDayInt];
        return day2;
    }
    if(nowDayTag == 103){
        nowDayInt = ABS(nowDayInt- ABS(nowDayTag - tag));
        day3 = [NSString stringWithFormat:@"%ld",nowDayInt];
        return day3;
    }
    if(nowDayTag == 104){
        nowDayInt = ABS(nowDayInt- ABS(nowDayTag - tag));
        day4 = [NSString stringWithFormat:@"%ld",nowDayInt];
        return day4;
    }
    if(nowDayTag == 105){
        nowDayInt = ABS(nowDayInt- ABS(nowDayTag - tag));
        day5 = [NSString stringWithFormat:@"%ld",nowDayInt];
        return day5;
    }
    if(nowDayTag == 106){
        nowDayInt = ABS(nowDayInt- ABS(nowDayTag - tag));
        day6 = [NSString stringWithFormat:@"%ld",nowDayInt];
        return day6;
    }
    
   
    return nowDay;
    
    
}

//获取某年某月的天数
- (int)howManyDaysInThisYear:(NSString *)year withMonth:(NSString *)month{
    //将str转为int
    int _year = [year intValue];
    int _month = [month intValue];
    if((_month == 1) || (_month == 3) || (_month == 5) || (_month == 7) || (_month == 8) || (_month == 10) || (_month == 12))
        return 31 ;
    if((_month == 4) || (_month == 6) || (_month == 9) || (_month == 11))
        return 30;
    if((_year % 4 == 1) || (_year % 4 == 2) || (_year % 4 == 3))
    {
        return 28;
    }
    if(_year % 400 == 0)
        return 29;
    if(_year % 100 == 0)
        return 28;
    return 29;
}

@end



